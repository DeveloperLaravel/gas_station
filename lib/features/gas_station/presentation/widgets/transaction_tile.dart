import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/fuel_transaction.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.item});
  final FuelTransaction item;
  @override Widget build(BuildContext context) => Card(child: ListTile(
    leading: const CircleAvatar(child: Icon(Icons.local_gas_station)),
    title: Text(item.plateNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text('${item.fuelType.label} • ${item.quantityLiters.toStringAsFixed(1)} لتر\n${item.employeeName} • ${DateFormat('yyyy/MM/dd HH:mm').format(item.createdAt)}'),
    isThreeLine: true,
  ));
}
