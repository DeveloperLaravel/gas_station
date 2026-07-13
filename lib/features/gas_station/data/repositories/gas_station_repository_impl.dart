import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

import '../../../../core/utils/plate_normalizer.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../../domain/entities/fuel_transaction.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/entities/vehicle_eligibility.dart';
import '../../domain/repositories/gas_station_repository.dart';
import '../models/fuel_transaction_isar_model.dart';
import '../models/vehicle_isar_model.dart';

@LazySingleton(as: GasStationRepository)
class GasStationRepositoryImpl implements GasStationRepository {
  GasStationRepositoryImpl(this._isar);

  final Isar _isar;
  static const cooldown = Duration(days: 3);

  Vehicle _vehicle(VehicleIsarModel m) => Vehicle(
        id: m.id,
        plateNumber: m.plateNumber,
        normalizedPlateNumber: m.normalizedPlateNumber,
        qrCode: m.qrCode,
        ownerName: m.ownerName,
        notes: m.notes,
        createdAt: m.createdAt,
      );

  FuelTransaction _transaction(FuelTransactionIsarModel m) => FuelTransaction(
        id: m.id,
        vehicleId: m.vehicleId,
        plateNumber: m.plateNumber,
        fuelType: FuelType.values.firstWhere((e) => e.name == m.fuelType),
        quantityLiters: m.quantityLiters,
        employeeName: m.employeeName,
        notes: m.notes,
        createdAt: m.createdAt,
      );

  @override
  Future<Vehicle> registerVehicle({required String plateNumber, String? qrCode, String? ownerName, String? notes}) async {
    final normalized = PlateNormalizer.normalize(plateNumber);
    if (normalized.isEmpty) throw StateError('رقم اللوحة مطلوب');

    final duplicate = await _isar.vehicleIsarModels
        .filter()
        .normalizedPlateNumberEqualTo(normalized, caseSensitive: false)
        .findFirst();
    if (duplicate != null) throw StateError('رقم اللوحة مسجل مسبقًا');

    if (qrCode != null && qrCode.trim().isNotEmpty) {
      final qrDuplicate = await _isar.vehicleIsarModels.filter().qrCodeEqualTo(qrCode.trim()).findFirst();
      if (qrDuplicate != null) throw StateError('رمز QR مرتبط بسيارة أخرى');
    }

    final model = VehicleIsarModel()
      ..plateNumber = plateNumber.trim()
      ..normalizedPlateNumber = normalized
      ..qrCode = qrCode?.trim().isEmpty == true ? null : qrCode?.trim()
      ..ownerName = ownerName?.trim()
      ..notes = notes?.trim()
      ..createdAt = DateTime.now();

    await _isar.writeTxn(() => _isar.vehicleIsarModels.put(model));
    return _vehicle(model);
  }

  @override
  Future<Vehicle?> findVehicle(String plateOrQr) async {
    final raw = plateOrQr.trim();
    final normalized = PlateNormalizer.normalize(raw);
    final model = await _isar.vehicleIsarModels
        .filter()
        .group((q) => q.qrCodeEqualTo(raw).or().normalizedPlateNumberEqualTo(normalized, caseSensitive: false))
        .findFirst();
    return model == null ? null : _vehicle(model);
  }

  @override
  Future<VehicleEligibility> checkEligibility(int vehicleId) async {
    final vehicleModel = await _isar.vehicleIsarModels.get(vehicleId);
    if (vehicleModel == null) throw StateError('السيارة غير موجودة');

    final last = await _isar.fuelTransactionIsarModels
        .filter()
        .vehicleIdEqualTo(vehicleId)
        .sortByCreatedAtDesc()
        .findFirst();

    if (last == null) return VehicleEligibility(vehicle: _vehicle(vehicleModel), isAllowed: true);

    final nextAllowedAt = last.createdAt.add(cooldown);
    final allowed = !DateTime.now().isBefore(nextAllowedAt);
    return VehicleEligibility(
      vehicle: _vehicle(vehicleModel),
      isAllowed: allowed,
      lastTransaction: _transaction(last),
      nextAllowedAt: nextAllowedAt,
    );
  }

  @override
  Future<FuelTransaction> registerFueling({required int vehicleId, required FuelType fuelType, required double quantityLiters, required String employeeName, String? notes}) async {

    late FuelTransactionIsarModel saved;
    await _isar.writeTxn(() async {
      // إعادة الفحص داخل نفس معاملة Isar يمنع تسجيل عمليتين متتاليتين.
      final vehicle = await _isar.vehicleIsarModels.get(vehicleId);
      if (vehicle == null) throw StateError('السيارة غير موجودة');

      final last = await _isar.fuelTransactionIsarModels
          .filter()
          .vehicleIdEqualTo(vehicleId)
          .sortByCreatedAtDesc()
          .findFirst();
      if (last != null && DateTime.now().isBefore(last.createdAt.add(cooldown))) {
        throw StateError('السيارة غير مؤهلة للتعبئة الآن');
      }

      saved = FuelTransactionIsarModel()
        ..vehicleId = vehicleId
        ..plateNumber = vehicle.plateNumber
        ..fuelType = fuelType.name
        ..quantityLiters = quantityLiters
        ..employeeName = employeeName.trim()
        ..notes = notes?.trim()
        ..createdAt = DateTime.now();
      await _isar.fuelTransactionIsarModels.put(saved);
    });
    return _transaction(saved);
  }

  @override
  Future<DashboardSummary> getDashboard() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));
    final vehicles = await _isar.vehicleIsarModels.count();
    final all = await _isar.fuelTransactionIsarModels.where().sortByCreatedAtDesc().findAll();
    final today = all.where((e) => !e.createdAt.isBefore(start) && e.createdAt.isBefore(end)).toList();
    return DashboardSummary(
      vehicleCount: vehicles,
      todayTransactions: today.length,
      totalTransactions: all.length,
      todayLiters: today.fold(0, (sum, item) => sum + item.quantityLiters),
      recentTransactions: all.take(8).map(_transaction).toList(),
    );
  }

  @override
  Future<List<FuelTransaction>> getTransactions() async {
    final values = await _isar.fuelTransactionIsarModels.where().sortByCreatedAtDesc().findAll();
    return values.map(_transaction).toList();
  }
  
}
