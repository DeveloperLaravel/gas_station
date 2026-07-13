import 'package:isar_community/isar.dart';

part 'fuel_transaction_isar_model.g.dart';

@collection
class FuelTransactionIsarModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int vehicleId;

  @Index(caseSensitive: false)
  late String plateNumber;

  late String fuelType;
  late double quantityLiters;
  late String employeeName;
  String? notes;

  @Index()
  late DateTime createdAt;
}
