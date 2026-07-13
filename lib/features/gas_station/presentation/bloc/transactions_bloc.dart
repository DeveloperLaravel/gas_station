import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/fuel_transaction.dart';
import '../../domain/usecases/gas_station_usecases.dart';

sealed class TransactionsState extends Equatable { const TransactionsState(); @override List<Object?> get props => []; }
class TransactionsLoading extends TransactionsState {}
class TransactionsLoaded extends TransactionsState { const TransactionsLoaded(this.items); final List<FuelTransaction> items; @override List<Object?> get props => [items]; }
class TransactionsFailure extends TransactionsState { const TransactionsFailure(this.message); final String message; @override List<Object?> get props => [message]; }

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit(this._get) : super(TransactionsLoading());
  final GetTransactionsUsecase _get;
  Future<void> load() async { emit(TransactionsLoading()); try { emit(TransactionsLoaded(await _get())); } catch (e) { emit(TransactionsFailure(e.toString())); } }
}
