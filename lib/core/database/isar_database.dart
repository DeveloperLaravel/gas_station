import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/gas_station/data/models/fuel_transaction_isar_model.dart';
import '../../features/gas_station/data/models/vehicle_isar_model.dart';

class IsarDatabase {
  static const _name = 'gas_station_db';

  Future<Isar> open() async {
    final current = Isar.getInstance(_name);
    if (current != null) return current;

    final directory = await getApplicationDocumentsDirectory();
    return Isar.open(
      [VehicleIsarModelSchema, FuelTransactionIsarModelSchema],
      name: _name,
      directory: directory.path,
      inspector: true,
    );
  }
}
