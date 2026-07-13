import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';

import '../../features/gas_station/data/repositories/gas_station_repository_impl.dart';
import '../../features/gas_station/domain/repositories/gas_station_repository.dart';
import '../../features/gas_station/domain/usecases/gas_station_usecases.dart';
import '../../features/gas_station/presentation/bloc/dashboard_bloc.dart';
import '../../features/gas_station/presentation/bloc/transactions_bloc.dart';
import '../../features/gas_station/presentation/bloc/vehicle/vehicle_bloc.dart';
import '../database/isar_database.dart';
import '../router/app_router.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final isar = await IsarDatabase().open();
  getIt.registerSingleton<Isar>(isar);
  getIt.registerLazySingleton<GasStationRepository>(() => GasStationRepositoryImpl(getIt()));

  getIt.registerFactory(() => RegisterVehicleUsecase(getIt()));
  getIt.registerFactory(() => FindVehicleUsecase(getIt()));
  getIt.registerFactory(() => CheckEligibilityUsecase(getIt()));
  getIt.registerFactory(() => RegisterFuelingUsecase(getIt()));
  getIt.registerFactory(() => GetDashboardUsecase(getIt()));
  getIt.registerFactory(() => GetTransactionsUsecase(getIt()));

  getIt.registerFactory(() => DashboardBloc(getIt()));
  getIt.registerFactory(() => VehicleBloc(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory(() => TransactionsCubit(getIt()));
  getIt.registerLazySingleton(() => AppRouter());
}
