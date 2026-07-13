import 'package:equatable/equatable.dart';

import 'fuel_transaction.dart';

class DashboardSummary extends Equatable {
  const DashboardSummary({
    required this.vehicleCount,
    required this.todayTransactions,
    required this.totalTransactions,
    required this.todayLiters,
    required this.recentTransactions,
  });

  final int vehicleCount;
  final int todayTransactions;
  final int totalTransactions;
  final double todayLiters;
  final List<FuelTransaction> recentTransactions;

  @override
  List<Object?> get props => [vehicleCount, todayTransactions, totalTransactions, todayLiters, recentTransactions];
}
