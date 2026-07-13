import 'package:equatable/equatable.dart';

import 'fuel_transaction.dart';
import 'vehicle.dart';

class VehicleEligibility extends Equatable {
  const VehicleEligibility({
    required this.vehicle,
    required this.isAllowed,
    this.lastTransaction,
    this.nextAllowedAt,
  });

  final Vehicle vehicle;
  final bool isAllowed;
  final FuelTransaction? lastTransaction;
  final DateTime? nextAllowedAt;

  Duration remaining([DateTime? now]) {
    if (isAllowed || nextAllowedAt == null) return Duration.zero;
    final value = nextAllowedAt!.difference(now ?? DateTime.now());
    return value.isNegative ? Duration.zero : value;
  }

  @override
  List<Object?> get props => [vehicle, isAllowed, lastTransaction, nextAllowedAt];
}
