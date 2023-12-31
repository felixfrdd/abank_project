import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:abank_project/firebase/firestore_user_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({super.key});

  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  final FirestoreUserForm _firestoreForm = FirestoreUserForm();
  String accNumField = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String accNum = await _firestoreForm.getAccNumFromFirestoreWithEmail(
        FirebaseAuth.instance.currentUser!.email!);
    setState(() {
      accNumField = accNum;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Show QR"),
            centerTitle: true,
            backgroundColor: const Color(0xFF363636)),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "QRIS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 250,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sumber Dana",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                accNumField,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ])),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tunjukan QRIS",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        )),
                    QrImageView(
                      data: accNumField,
                      version: QrVersions.auto,
                      size: 250,
                      backgroundColor: Colors.white,
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 35),
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: const Center(
                      child: Text(
                    "Perlihatkan QRIS dengan jelas kepada kamera",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )),
                )),
          ],
        )));
  }
}
