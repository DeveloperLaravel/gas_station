import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/transactions_bloc.dart';
import '../widgets/transaction_tile.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('سجل عمليات التعبئة')),
    body: BlocBuilder<TransactionsCubit, TransactionsState>(builder: (context, state) {
      if (state is TransactionsLoading) return const Center(child: CircularProgressIndicator());
      if (state is TransactionsFailure) return Center(child: Text(state.message));
      final items=(state as TransactionsLoaded).items;
      if(items.isEmpty) return const Center(child: Text('لا توجد عمليات تعبئة'));
      return RefreshIndicator(onRefresh: context.read<TransactionsCubit>().load, child: ListView.builder(padding: const EdgeInsets.all(12), itemCount: items.length, itemBuilder: (_,i)=>TransactionTile(item:items[i])));
    }),
  );
}
