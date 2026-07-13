import 'package:injectable/injectable.dart';

import '../entities/dashboard_summary.dart';
import '../entities/fuel_transaction.dart';
import '../entities/vehicle.dart';
import '../entities/vehicle_eligibility.dart';
import '../repositories/gas_station_repository.dart';

@injectable
class RegisterVehicleUsecase {
  RegisterVehicleUsecase(this._repository);
  final GasStationRepository _repository;
  Future<Vehicle> call({required String plateNumber, String? qrCode, String? ownerName, String? notes}) =>
      _repository.registerVehicle(plateNumber: plateNumber, qrCode: qrCode, ownerName: ownerName, notes: notes);
}

@injectable
class FindVehicleUsecase {
  FindVehicleUsecase(this._repository);
  final GasStationRepository _repository;
  Future<Vehicle?> call(String value) => _repository.findVehicle(value);
}

@injectable
class CheckEligibilityUsecase {
  CheckEligibilityUsecase(this._repository);
  final GasStationRepository _repository;
  Future<VehicleEligibility> call(int vehicleId) => _repository.checkEligibility(vehicleId);
}

@injectable
class RegisterFuelingUsecase {
  const RegisterFuelingUsecase(this.repository);

  final GasStationRepository repository;

  Future<FuelTransaction> call({
    required int vehicleId,
    required FuelType fuelType,
    required double quantityLiters,
    required String employeeName,
    String? notes,
  }) async {
    final eligibility = await repository.checkEligibility(vehicleId);

    if (!eligibility.isAllowed) {
      throw StateError(
        'السيارة غير مؤهلة للتعبئة حتى '
        '${eligibility.nextAllowedAt}',
      );
    }


    return repository.registerFueling(
      vehicleId: vehicleId,
      fuelType: fuelType,
      quantityLiters: quantityLiters,
      employeeName: employeeName,
      notes: notes,
    );
  }
}

@injectable
class GetDashboardUsecase {
  GetDashboardUsecase(this._repository);
  final GasStationRepository _repository;
  Future<DashboardSummary> call() => _repository.getDashboard();
}

@injectable
class GetTransactionsUsecase {
  GetTransactionsUsecase(this._repository);
  final GasStationRepository _repository;
  Future<List<FuelTransaction>> call() => _repository.getTransactions();
}
