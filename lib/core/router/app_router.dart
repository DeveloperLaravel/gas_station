import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/gas_station/presentation/bloc/dashboard_bloc.dart';
import '../../features/gas_station/presentation/bloc/transactions_bloc.dart';
import '../../features/gas_station/presentation/bloc/vehicle/vehicle_bloc.dart';
import '../../features/gas_station/presentation/pages/dashboard_page.dart';
import '../../features/gas_station/presentation/pages/qr_scanner_page.dart';
import '../../features/gas_station/presentation/pages/transactions_page.dart';
import '../../features/gas_station/presentation/pages/vehicle_page.dart';
import '../di/injection.dart';

abstract final class RouteNames {
  static const dashboard = 'dashboard';
  static const vehicle = 'vehicle';
  static const transactions = 'transactions';
  static const qr = 'qr';
}

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // ignore: unnecessary_underscores
      GoRoute(name: RouteNames.dashboard, path: '/', builder: (_, __) => BlocProvider(create: (_) => getIt<DashboardBloc>()..add(DashboardStarted()), child: const DashboardPage())),
      // ignore: unnecessary_underscores
      GoRoute(name: RouteNames.vehicle, path: '/vehicle', builder: (_, __) => BlocProvider(create: (_) => getIt<VehicleBloc>(), child: const VehiclePage())),
      // ignore: unnecessary_underscores
      GoRoute(name: RouteNames.transactions, path: '/transactions', builder: (_, __) => BlocProvider(create: (_) => getIt<TransactionsCubit>()..load(), child: const TransactionsPage())),
      // ignore: unnecessary_underscores
      GoRoute(name: RouteNames.qr, path: '/qr', builder: (_, __) => const QrScannerPage()),
    ],
  );
}
