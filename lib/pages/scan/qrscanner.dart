import 'dart:developer';
import 'dart:io';
import '/pages/transfer_history/transfer_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF363636),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(flex: 2, child: _buildQrView(context)),
          Positioned(
              child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 25),
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFD9D9D9))),
                            child: const Text(
                              "Scan QR",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(right: 25),
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const TransferHistoryPage(),
                              ));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFD9D9D9))),
                            child: const Text(
                              "History",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (result != null)
                  Expanded(
                      flex: 7,
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.only(
                            right: 100, left: 100, top: 130, bottom: 160),
                        padding:
                            const EdgeInsets.only(top: 10, right: 5, left: 5),
                        decoration: const BoxDecoration(
                            color: Color(0xFF363636),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Barcode Type",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                describeEnum(result!.format),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              const Text("Result",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "${result!.code}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (result != null && result!.code != null) {
                                    await Clipboard.setData(
                                        ClipboardData(text: "${result!.code}"));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Copied to clipboard')),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Cannot copy null or undefined value')),
                                    );
                                  }
                                  Navigator.pop(context);
                                },
                                icon:
                                    const Icon(Icons.copy, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ))
                else
                  Expanded(flex: 7, child: Container()),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF363636),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: const Text(
                                "SHOW QR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Bayar",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 20),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Transfer",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutBottomOffset: 50,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      cameraFacing: CameraFacing.back,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
