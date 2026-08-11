import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/stat_card.dart';
import '../widgets/transaction_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/2.png',
            fit: BoxFit.contain,
          ),
        ),
        title: const Text('محطة البنزين'),
        actions: [
          IconButton(
            tooltip: 'سجل العمليات',
            onPressed: () {
              context.pushNamed(
                RouteNames.transactions,
              );
            },
            icon: const Icon(
              Icons.receipt_long,
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () async {
          await context.pushNamed(
            RouteNames.vehicle,
          );

          if (context.mounted) {
            context
                .read<DashboardBloc>()
                .add(
                  DashboardRefreshed(),
                );
          }
        },
        icon: const Icon(
          Icons.local_gas_station,
        ),
        label: const Text(
          'تسجيل تعبئة',
        ),
      ),

      body: BlocBuilder<
          DashboardBloc,
          DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading ||
              state is DashboardInitial) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (state
              is DashboardFailure) {
            return _DashboardError(
              message: state.message,
            );
          }

          final summary =
              (state as DashboardLoaded)
                  .summary;

          return LayoutBuilder(
            builder:
                (context, constraints) {
              final width =
                  constraints.maxWidth;

              final isMobile =
                  width < 600;

              final isTablet =
                  width >= 600 &&
                      width < 1100;

              final horizontalPadding =
                  isMobile
                      ? 16.0
                      : isTablet
                          ? 24.0
                          : 32.0;

              final maxContentWidth =
                  width >= 1400
                      ? 1250.0
                      : width;

              final crossAxisCount =
                  _getCrossAxisCount(
                width,
              );

              return RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<
                          DashboardBloc>()
                      .add(
                        DashboardRefreshed(),
                      );
                },

                child: Align(
                  alignment:
                      Alignment.topCenter,

                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(
                      maxWidth:
                          maxContentWidth,
                    ),

                    child: ListView(
                      physics:
                          const AlwaysScrollableScrollPhysics(),

                      padding:
                          EdgeInsets.fromLTRB(
                        horizontalPadding,
                        16,
                        horizontalPadding,
                        110,
                      ),

                      children: [
                        // ==========================
                        // Header
                        // ==========================

                        _DashboardHeader(
                          vehicleCount:
                              summary
                                  .vehicleCount,
                          todayTransactions:
                              summary
                                  .todayTransactions,
                        ),

                        const SizedBox(
                          height: 22,
                        ),

                        // ==========================
                        // Stats
                        // ==========================

                        GridView.builder(
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(),

                          itemCount: 2,

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                crossAxisCount,

                            crossAxisSpacing:
                                12,

                            mainAxisSpacing:
                                12,

                            childAspectRatio:
                                _getAspectRatio(
                              width,
                            ),
                          ),

                          itemBuilder:
                              (context,
                                  index) {
                            if (index == 0) {
                              return StatCard(
                                title:
                                    'السيارات المسجلة',

                                value:
                                    '${summary.vehicleCount}',

                                icon: Icons
                                    .directions_car,
                              );
                            }

                            return StatCard(
                              title:
                                  'عمليات تعبئة اليوم',

                              value:
                                  '${summary.todayTransactions}',

                              icon:
                                  Icons.today,
                            );
                          },
                        ),

                        const SizedBox(
                          height: 28,
                        ),

                        // ==========================
                        // Recent title
                        // ==========================

                        _RecentHeader(
                          onViewAll: () {
                            context.pushNamed(
                              RouteNames
                                  .transactions,
                            );
                          },
                        ),

                        const SizedBox(
                          height: 12,
                        ),

                        // ==========================
                        // Recent transactions
                        // ==========================

                        if (summary
                            .recentTransactions
                            .isEmpty)
                          const _EmptyTransactions()
                        else
                          ...summary
                              .recentTransactions
                              .map(
                            (item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child:
                                    TransactionTile(
                                  item: item,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // ============================================================
  // Grid columns
  // ============================================================

  int _getCrossAxisCount(
    double width,
  ) {
    if (width < 500) {
      return 1;
    }

    if (width < 900) {
      return 2;
    }

    if (width < 1300) {
      return 3;
    }

    return 4;
  }

  // ============================================================
  // Card ratio
  // ============================================================

  double _getAspectRatio(
    double width,
  ) {
    if (width < 500) {
      return 2.7;
    }

    if (width < 800) {
      return 1.55;
    }

    return 1.7;
  }
}

// ============================================================
// Dashboard Header
// ============================================================

class _DashboardHeader
    extends StatelessWidget {
  const _DashboardHeader({
    required this.vehicleCount,
    required this.todayTransactions,
  });

  final int vehicleCount;
  final int todayTransactions;

  @override
  Widget build(
    BuildContext context,
  ) {
    return LayoutBuilder(
      builder:
          (context, constraints) {
        final isSmall =
            constraints.maxWidth <
                600;

        if (isSmall) {
          return Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'لوحة التحكم',
                style:
                    Theme.of(context)
                        .textTheme
                        .headlineSmall,
              ),

              const SizedBox(
                height: 6,
              ),

              Text(
                'تابع السيارات وعمليات التعبئة اليومية',
                style:
                    Theme.of(context)
                        .textTheme
                        .bodyMedium,
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'لوحة التحكم',
                    style:
                        Theme.of(context)
                            .textTheme
                            .headlineMedium,
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Text(
                    'تابع السيارات وعمليات التعبئة اليومية',
                    style:
                        Theme.of(context)
                            .textTheme
                            .bodyMedium,
                  ),
                ],
              ),
            ),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _MiniStat(
                  icon: Icons
                      .directions_car,
                  label: 'السيارات',
                  value:
                      '$vehicleCount',
                ),

                _MiniStat(
                  icon: Icons.today,
                  label: 'اليوم',
                  value:
                      '$todayTransactions',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// ============================================================
// Mini Stat
// ============================================================

class _MiniStat
    extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest,

        borderRadius:
            BorderRadius.circular(
          14,
        ),
      ),

      child: Row(
        mainAxisSize:
            MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
          ),

          const SizedBox(
            width: 8,
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    Theme.of(context)
                        .textTheme
                        .bodySmall,
              ),

              Text(
                value,
                style:
                    Theme.of(context)
                        .textTheme
                        .titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Recent header
// ============================================================

class _RecentHeader
    extends StatelessWidget {
  const _RecentHeader({
    required this.onViewAll,
  });

  final VoidCallback onViewAll;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'آخر عمليات التعبئة',
            style:
                Theme.of(context)
                    .textTheme
                    .titleLarge,
          ),
        ),

        TextButton.icon(
          onPressed:
              onViewAll,
          icon: const Icon(
            Icons.arrow_back,
            size: 18,
          ),
          label:
              const Text(
            'عرض الكل',
          ),
        ),
      ],
    );
  }
}

// ============================================================
// Empty
// ============================================================

class _EmptyTransactions
    extends StatelessWidget {
  const _EmptyTransactions();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerLow,

        borderRadius:
            BorderRadius.circular(
          18,
        ),
      ),

      child: Column(
        children: [
          Icon(
            Icons
                .local_gas_station_outlined,
            size: 52,
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant,
          ),

          const SizedBox(
            height: 12,
          ),

          Text(
            'لا توجد عمليات تعبئة بعد',
            style:
                Theme.of(context)
                    .textTheme
                    .titleMedium,
          ),

          const SizedBox(
            height: 5,
          ),

          Text(
            'ستظهر آخر العمليات هنا بعد تسجيل أول تعبئة',
            textAlign:
                TextAlign.center,
            style:
                Theme.of(context)
                    .textTheme
                    .bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Error
// ============================================================

class _DashboardError
    extends StatelessWidget {
  const _DashboardError({
    required this.message,
  });

  final String message;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.all(
          24,
        ),

        child: Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 54,
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              message,
              textAlign:
                  TextAlign.center,
            ),

            const SizedBox(
              height: 18,
            ),

            FilledButton.icon(
              onPressed: () {
                context
                    .read<
                        DashboardBloc>()
                    .add(
                      DashboardRefreshed(),
                    );
              },

              icon: const Icon(
                Icons.refresh,
              ),

              label:
                  const Text(
                'إعادة المحاولة',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
