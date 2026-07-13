import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerPage extends StatefulWidget { const QrScannerPage({super.key}); @override State<QrScannerPage> createState()=>_QrScannerPageState(); }
class _QrScannerPageState extends State<QrScannerPage> {
  bool completed=false;
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('مسح QR')),body:MobileScanner(onDetect:(capture){ if(completed)return; final value=capture.barcodes.isEmpty ? null : capture.barcodes.first.rawValue; if(value!=null){completed=true;Navigator.pop(context,value);} }));
}
