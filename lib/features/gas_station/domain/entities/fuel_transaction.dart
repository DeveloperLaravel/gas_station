import 'package:equatable/equatable.dart';

enum FuelType { gasoline95, gasoline91, diesel }

extension FuelTypeX on FuelType {
  String get label => switch (this) {
        FuelType.gasoline95 => 'بنزين 95',
        FuelType.gasoline91 => 'بنزين 91',
        FuelType.diesel => 'ديزل',
      };
}

class FuelTransaction extends Equatable {
  const FuelTransaction({
    required this.id,
    required this.vehicleId,
    required this.plateNumber,
    required this.fuelType,
    required this.quantityLiters,
    required this.employeeName,
    required this.createdAt,
    this.notes,
  });

  final int id;
  final int vehicleId;
  final String plateNumber;
  final FuelType fuelType;
  final double quantityLiters;
  final String employeeName;
  final String? notes;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, vehicleId, fuelType, quantityLiters, employeeName, notes, createdAt];
}
