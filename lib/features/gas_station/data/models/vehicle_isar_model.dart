import 'package:isar_community/isar.dart';

part 'vehicle_isar_model.g.dart';

@collection
class VehicleIsarModel {
  Id id = Isar.autoIncrement;

  late String plateNumber;

  @Index(unique: true, replace: false, caseSensitive: false)
  late String normalizedPlateNumber;

  @Index(unique: true, replace: false, caseSensitive: false)
  String? qrCode;

  String? ownerName;
  String? notes;

  @Index()
  late DateTime createdAt;
}
