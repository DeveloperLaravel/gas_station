// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;

import '../../features/gas_station/data/repositories/gas_station_repository_impl.dart'
    as _i1070;
import '../../features/gas_station/domain/repositories/gas_station_repository.dart'
    as _i1068;
import '../../features/gas_station/domain/usecases/gas_station_usecases.dart'
    as _i641;
import '../../features/gas_station/presentation/bloc/dashboard_bloc.dart'
    as _i1013;
import '../../features/gas_station/presentation/bloc/transactions_bloc.dart'
    as _i930;
import '../../features/gas_station/presentation/bloc/vehicle/vehicle_bloc.dart'
    as _i944;
import '../router/app_router.dart' as _i81;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i214.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i81.AppRouter>(() => _i81.AppRouter());
    gh.lazySingleton<_i1068.GasStationRepository>(
      () => _i1070.GasStationRepositoryImpl(gh<_i214.Isar>()),
    );
    gh.factory<_i641.RegisterFuelingUsecase>(
      () => _i641.RegisterFuelingUsecase(gh<_i1068.GasStationRepository>()),
    );
    gh.factory<_i641.RegisterVehicleUsecase>(
      () => _i641.RegisterVehicleUsecase(gh<_i1068.GasStationRepository>()),
    );
    gh.factory<_i641.FindVehicleUsecase>(
      () => _i641.FindVehicleUsecase(gh<_i1068.GasStationRepository>()),
    );
    gh.factory<_i641.CheckEligibilityUsecase>(
      () => _i641.CheckEligibilityUsecase(gh<_i1068.GasStationRepository>()),
    );
    gh.factory<_i641.GetDashboardUsecase>(
      () => _i641.GetDashboardUsecase(gh<_i1068.GasStationRepository>()),
    );
    gh.factory<_i641.GetTransactionsUsecase>(
      () => _i641.GetTransactionsUsecase(gh<_i1068.GasStationRepository>()),
    );
    gh.factory<_i1013.DashboardBloc>(
      () => _i1013.DashboardBloc(gh<_i641.GetDashboardUsecase>()),
    );
    gh.factory<_i930.TransactionsCubit>(
      () => _i930.TransactionsCubit(gh<_i641.GetTransactionsUsecase>()),
    );
    gh.factory<_i944.VehicleBloc>(
      () => _i944.VehicleBloc(
        gh<_i641.FindVehicleUsecase>(),
        gh<_i641.CheckEligibilityUsecase>(),
        gh<_i641.RegisterVehicleUsecase>(),
        gh<_i641.RegisterFuelingUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
