import 'package:equatable/equatable.dart';

import '../../../domain/entities/vehicle_eligibility.dart';

sealed class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object?> get props => [];
}

final class VehicleInitial extends VehicleState {
  const VehicleInitial();
}

final class VehicleLoading extends VehicleState {
  const VehicleLoading();
}

final class VehicleNotFound extends VehicleState {
  const VehicleNotFound(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

final class VehicleReady extends VehicleState {
  const VehicleReady(this.result);

  final VehicleEligibility result;

  @override
  List<Object?> get props => [result];
}

final class VehicleSuccess extends VehicleState {
  const VehicleSuccess({
    required this.message,
    required this.result,
  });

  final String message;
  final VehicleEligibility result;

  @override
  List<Object?> get props => [
        message,
        result,
      ];
}

final class VehicleFailure extends VehicleState {
  const VehicleFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
