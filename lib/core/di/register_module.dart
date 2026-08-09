import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

import '../database/isar_database.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Isar> get isar async {
    return IsarDatabase().open();
  }
}
