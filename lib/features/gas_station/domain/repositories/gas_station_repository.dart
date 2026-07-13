import '../entities/dashboard_summary.dart';
import '../entities/fuel_transaction.dart';
import '../entities/vehicle.dart';
import '../entities/vehicle_eligibility.dart';

abstract interface class GasStationRepository {
  Future<Vehicle> registerVehicle({
    required String plateNumber,
    String? qrCode,
    String? ownerName,
    String? notes,
  });

  Future<Vehicle?> findVehicle(String plateOrQr);
  Future<VehicleEligibility> checkEligibility(int vehicleId);

  Future<FuelTransaction> registerFueling({
    required int vehicleId,
    required FuelType fuelType,
    required double quantityLiters,
    required String employeeName,
    String? notes,
  });

  Future<DashboardSummary> getDashboard();
  Future<List<FuelTransaction>> getTransactions();
}
