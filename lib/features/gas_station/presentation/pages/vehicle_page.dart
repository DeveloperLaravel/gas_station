import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/vehicle_eligibility.dart';
import '../bloc/vehicle/vehicle_bloc.dart';
import '../bloc/vehicle/vehicle_event.dart';
import '../bloc/vehicle/vehicle_state.dart';

class VehiclePage extends StatefulWidget { const VehiclePage({super.key}); @override State<VehiclePage> createState() => _VehiclePageState(); }
class _VehiclePageState extends State<VehiclePage> {
  final search = TextEditingController();
  Timer? timer;
  @override void dispose() { search.dispose(); timer?.cancel(); super.dispose(); }
  Future<void> scan() async { final value = await context.pushNamed<String>(RouteNames.qr); if (value != null && mounted) { search.text = value; context.read<VehicleBloc>().add(VehicleSearched(value)); } }
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('فحص السيارة')),
    body: BlocConsumer<VehicleBloc, VehicleState>(
      listener: (context, state) { if (state is VehicleFailure) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message))); if (state is VehicleSuccess) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message))); },
      builder: (context, state) => ListView(padding: const EdgeInsets.all(16), children: [
        TextField(controller: search, decoration: InputDecoration(labelText: 'رقم اللوحة أو QR', prefixIcon: const Icon(Icons.directions_car), suffixIcon: IconButton(onPressed: scan, icon: const Icon(Icons.qr_code_scanner))), onSubmitted: (v) => context.read<VehicleBloc>().add(VehicleSearched(v))),
        const SizedBox(height: 12),
        FilledButton.icon(onPressed: state is VehicleLoading ? null : () => context.read<VehicleBloc>().add(VehicleSearched(search.text)), icon: const Icon(Icons.search), label: const Text('فحص السيارة')),
        const SizedBox(height: 24),
        if (state is VehicleLoading) const Center(child: CircularProgressIndicator()),
        if (state is VehicleNotFound) _NotFound(query: state.query),
        if (state is VehicleReady) _EligibilityCard(result: state.result),
        if (state is VehicleSuccess) _EligibilityCard(result: state.result),
      ]),
    ),
  );
}

class _NotFound extends StatelessWidget {
  const _NotFound({required this.query}); final String query;
  @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [
    const Icon(Icons.no_crash, size: 52), const SizedBox(height: 10), const Text('السيارة غير مسجلة'), const SizedBox(height: 12),
    FilledButton(onPressed: () => _registerDialog(context, query), child: const Text('تسجيل سيارة جديدة')),
  ])));
  Future<void> _registerDialog(BuildContext context, String plate) async {
    final owner = TextEditingController(); final qr = TextEditingController(); final notes = TextEditingController();
    await showDialog(context: context, builder: (dialogContext) => AlertDialog(title: const Text('تسجيل سيارة'), content: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.min, children: [
      TextField(controller: owner, decoration: const InputDecoration(labelText: 'اسم المالك - اختياري')), const SizedBox(height: 8),
      TextField(controller: qr, decoration: const InputDecoration(labelText: 'اللوحة -QR - اختياري')), const SizedBox(height: 8),
      TextField(controller: notes, decoration: const InputDecoration(labelText: 'ملاحظات')),
    ])), actions: [TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('إلغاء')), FilledButton(onPressed: () { Navigator.pop(dialogContext); context.read<VehicleBloc>().add(VehicleCreated(plate: plate, qr: qr.text, owner: owner.text, notes: notes.text)); }, child: const Text('حفظ'))]));
  }
}

class _EligibilityCard extends StatefulWidget { const _EligibilityCard({required this.result}); final VehicleEligibility result; @override State<_EligibilityCard> createState() => _EligibilityCardState(); }
class _EligibilityCardState extends State<_EligibilityCard> {
  Timer? timer; @override void initState(){ super.initState(); timer=Timer.periodic(const Duration(seconds: 1), (_) { if(mounted) setState((){});}); } @override void dispose(){timer?.cancel();super.dispose();}
  String remaining() { final d=widget.result.remaining(); final days=d.inDays; final hours=d.inHours%24; final minutes=d.inMinutes%60; return '$days يوم و $hours ساعة و $minutes دقيقة'; }
  @override Widget build(BuildContext context) { final r=widget.result; return Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Icon(r.isAllowed ? Icons.check_circle : Icons.timer, size: 58, color: r.isAllowed ? Colors.green : Colors.orange),
    Text(r.vehicle.plateNumber, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 8),
    Text(r.isAllowed ? 'مسموح بالتعبئة الآن' : 'غير مسموح بالتعبئة', textAlign: TextAlign.center),
    if (!r.isAllowed) ...[const SizedBox(height: 8), Text('الوقت المتبقي: ${remaining()}', textAlign: TextAlign.center), Text('موعد السماح: ${r.nextAllowedAt}', textAlign: TextAlign.center)],
    if (r.isAllowed) ...[const SizedBox(height: 14),
  FilledButton.icon(
  onPressed: r.isAllowed
      ? () {
          context.read<VehicleBloc>().add(
                FuelingSaved(
                  vehicleId: r.vehicle.id,
                ),
              );
        }
      : null,
  icon: const Icon(Icons.local_gas_station),
  label: const Text('تسجيل تعبئة'),
),
     
     ],
  ]))); }
  // Future<void> _fuelDialog(BuildContext context, int vehicleId) async {
  //   final quantity=TextEditingController(); final employee=TextEditingController(); final notes=TextEditingController(); FuelType type=FuelType.gasoline95;
  //   await showDialog(context: context, builder: (dialogContext) => StatefulBuilder(builder: (context, setLocal) => AlertDialog(title: const Text('تسجيل تعبئة'), content: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.min, children: [
  //     DropdownButtonFormField<FuelType>(initialValue: type, items: FuelType.values.map((e)=>DropdownMenuItem(value:e,child:Text(e.label))).toList(), onChanged:(v)=>setLocal(()=>type=v!)), const SizedBox(height:8),
  //     TextField(controller: quantity, keyboardType: const TextInputType.numberWithOptions(decimal:true), decoration: const InputDecoration(labelText:'الكمية باللتر')), const SizedBox(height:8),
  //     TextField(controller: employee, decoration: const InputDecoration(labelText:'اسم الموظف')), const SizedBox(height:8),
  //     TextField(controller: notes, decoration: const InputDecoration(labelText:'ملاحظات')),
  //   ])), actions:[TextButton(onPressed:()=>Navigator.pop(dialogContext),child:const Text('إلغاء')),FilledButton(onPressed:(){ final q=double.tryParse(quantity.text); if(q==null)return; Navigator.pop(dialogContext); context.read<VehicleBloc>().add(FuelingSaved(vehicleId:vehicleId,type:type,quantity:q,employee:employee.text,notes:notes.text));},child:const Text('حفظ'))])));
  // }
}
