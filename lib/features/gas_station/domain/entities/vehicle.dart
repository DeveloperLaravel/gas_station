import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  const Vehicle({
    required this.id,
    required this.plateNumber,
    required this.normalizedPlateNumber,
    required this.createdAt,
    this.qrCode,
    this.ownerName,
    this.notes,
  });

  final int id;
  final String plateNumber;
  final String normalizedPlateNumber;
  final String? qrCode;
  final String? ownerName;
  final String? notes;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, normalizedPlateNumber, qrCode, ownerName, notes, createdAt];
}
