import 'package:equatable/equatable.dart';


//
// Events
//

sealed class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object?> get props => [];
}

final class VehicleSearched extends VehicleEvent {
  const VehicleSearched(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

final class VehicleCreated extends VehicleEvent {
  const VehicleCreated({
    required this.plate,
    this.qr,
    this.owner,
    this.notes,
  });

  final String plate;
  final String? qr;
  final String? owner;
  final String? notes;

  @override
  List<Object?> get props => [
        plate,
        qr,
        owner,
        notes,
      ];
}

final class FuelingSaved extends VehicleEvent {
  const FuelingSaved({
    required this.vehicleId,
  });

  final int vehicleId;

}