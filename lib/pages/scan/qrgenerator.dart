import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerator extends StatelessWidget {
  const QRGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show QR"), centerTitle: true, backgroundColor: const Color(0xFF363636)),
      body:SafeArea(
        child : Column(
          children: [
            Expanded(
              flex:1,
              child: Container(
                color: Colors.amber,
                child: Row(
                  children: [
                    Text("QRIS", )
                  
                ]),
                )),
            Expanded(
              flex:2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: '085695467500', 
                    version: QrVersions.auto,size: 250,
                    backgroundColor: Colors.white,)
                ],
                )),
            Expanded(flex:1,child: Container(color: Colors.amber)),
          ],
        )
      )
    );
  }
}