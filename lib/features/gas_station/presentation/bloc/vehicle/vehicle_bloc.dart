import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/fuel_transaction.dart';
import '../../../domain/usecases/gas_station_usecases.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc(
    this._find,
    this._check,
    this._create,
    this._fuel,
  ) : super( VehicleInitial()) {
    on<VehicleSearched>(_onVehicleSearched);
    on<VehicleCreated>(_onVehicleCreated);
    on<FuelingSaved>(_onFuelingSaved);
  }

  final FindVehicleUsecase _find;
  final CheckEligibilityUsecase _check;
  final RegisterVehicleUsecase _create;
  final RegisterFuelingUsecase _fuel;

  Future<void> _onVehicleSearched(
    VehicleSearched event,
    Emitter<VehicleState> emit,
  ) async {
    final value = event.value.trim();

    if (value.isEmpty) {
      emit(const VehicleFailure('أدخل رقم اللوحة أو رمز QR'));
      return;
    }

    emit( VehicleLoading());

    try {
      final vehicle = await _find(value);

      if (vehicle == null) {
        emit(VehicleNotFound(value));
        return;
      }

      final eligibility = await _check(vehicle.id);

      emit(VehicleReady(eligibility));
    } catch (error) {
      emit(VehicleFailure(_message(error)));
    }
  }

  Future<void> _onVehicleCreated(
    VehicleCreated event,
    Emitter<VehicleState> emit,
  ) async {
    final plate = event.plate.trim();

    if (plate.isEmpty) {
      emit(const VehicleFailure('رقم اللوحة مطلوب'));
      return;
    }

    emit( VehicleLoading());

    try {
      final vehicle = await _create(
        plateNumber: plate,
        qrCode: _nullableText(event.qr),
        ownerName: _nullableText(event.owner),
        notes: _nullableText(event.notes),
      );

      final eligibility = await _check(vehicle.id);

      emit(
        VehicleSuccess(
          message: 'تم تسجيل السيارة بنجاح',
          result: eligibility,
        ),
      );
    } catch (error) {
      emit(VehicleFailure(_message(error)));
    }
  }

  Future<void> _onFuelingSaved(
    FuelingSaved event,
    Emitter<VehicleState> emit,
  ) async {
    emit( VehicleLoading());

    try {
      // يجب أن يقوم RegisterFuelingUseCase بإعادة فحص الأهلية
      // لحظة الحفظ لمنع تسجيل عمليتين متتاليتين.
      await _fuel(
        vehicleId: event.vehicleId,
        fuelType: FuelType.gasoline95,
        quantityLiters: 0,
        employeeName: '',
        notes: null,
      );

      // إعادة الفحص بعد التسجيل لحساب:
      // وقت التعبئة الحالية وموعد التعبئة القادمة بعد 3 أيام.
      final eligibility = await _check(event.vehicleId);

      emit(
        VehicleSuccess(
          message: 'تم تسجيل التعبئة بنجاح',
          result: eligibility,
        ),
      );
    } catch (error) {
      emit(VehicleFailure(_message(error)));
    }
  }

  String? _nullableText(String? value) {
    final normalized = value?.trim();

    if (normalized == null || normalized.isEmpty) {
      return null;
    }

    return normalized;
  }

  String _message(Object error) {
    return error
        .toString()
        .replaceFirst('Bad state: ', '')
        .replaceFirst('Exception: ', '');
  }
}