import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/stat_card.dart';
import '../widgets/transaction_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('محطة البنزين'), actions: [IconButton(onPressed: () => context.pushNamed(RouteNames.transactions), icon: const Icon(Icons.receipt_long))]),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () async { await context.pushNamed(RouteNames.vehicle); if (context.mounted) context.read<DashboardBloc>().add(DashboardRefreshed()); },
      icon: const Icon(Icons.search), label: const Text('تسجيل تعبئة'),
    ),
    body: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
      if (state is DashboardLoading || state is DashboardInitial) return const Center(child: CircularProgressIndicator());
      if (state is DashboardFailure) return Center(child: Text(state.message));
      final s = (state as DashboardLoaded).summary;
      return RefreshIndicator(
        onRefresh: () async => context.read<DashboardBloc>().add(DashboardRefreshed()),
        child: ListView(padding: const EdgeInsets.all(16), children: [
          GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 2, childAspectRatio: 1.45, crossAxisSpacing: 10, mainAxisSpacing: 10, children: [
            StatCard(title: 'السيارات المسجلة', value: '${s.vehicleCount}', icon: Icons.directions_car),
            StatCard(title: 'عمليات تعبيئة اليوم', value: '${s.todayTransactions}', icon: Icons.today),
          ]),
          const SizedBox(height: 22),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('آخر عمليات التعبئة', style: Theme.of(context).textTheme.titleLarge), TextButton(onPressed: () => context.pushNamed(RouteNames.transactions), child: const Text('عرض الكل'))]),
          if (s.recentTransactions.isEmpty) const Padding(padding: EdgeInsets.all(32), child: Center(child: Text('لا توجد عمليات بعد'))),
          ...s.recentTransactions.map((e) => TransactionTile(item: e)),
          const SizedBox(height: 90),
        ]),
      );
    }),
  );
}
