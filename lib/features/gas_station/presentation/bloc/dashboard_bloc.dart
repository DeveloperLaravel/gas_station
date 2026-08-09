import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/dashboard_summary.dart';
import '../../domain/usecases/gas_station_usecases.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override List<Object?> get props => [];
}
class DashboardStarted extends DashboardEvent {}
class DashboardRefreshed extends DashboardEvent {}

sealed class DashboardState extends Equatable {
  const DashboardState();
  @override List<Object?> get props => [];
}
class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
  const DashboardLoaded(this.summary);
  final DashboardSummary summary;
  @override List<Object?> get props => [summary];
}
class DashboardFailure extends DashboardState {
  const DashboardFailure(this.message);
  final String message;
  @override List<Object?> get props => [message];
}

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._getDashboard) : super(DashboardInitial()) {
    on<DashboardStarted>(_load);
    on<DashboardRefreshed>(_load);
  }
  final GetDashboardUsecase _getDashboard;
  Future<void> _load(DashboardEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try { emit(DashboardLoaded(await _getDashboard())); }
    catch (e) { emit(DashboardFailure(e.toString().replaceFirst('Bad state: ', ''))); }
  }
}
