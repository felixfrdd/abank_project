import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:abank_project/pages/myaccount/my_account.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:abank_project/firebase/firestore_user_form.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FirestoreUserForm _firestoreForm = FirestoreUserForm();
  final FirebaseFirestore gabFireCollection = FirebaseFirestore.instance;
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      key: _scaffoldKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: const Color(0xFF363636),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Change Pin"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15)),
              height: 150,
              width: 200,
              margin: const EdgeInsets.only(top: 50, bottom: 45),
              padding: const EdgeInsets.all(20),
              child: Image.asset('icons/lock.png'),
            ),
            buildTextField(
              controller: _currentPasswordController,
              labelText: "Current Pin",
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextField(
              controller: _newPasswordController,
              labelText: "New Pin",
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextField(
              controller: _confirmPasswordController,
              labelText: "Confirm Pin",
            ),
       

            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: MaterialButton(
                    color: const Color.fromARGB(255, 70, 172, 254),
                    onPressed: () {
                      final confirmPin = _confirmPasswordController.text;
                      final oldPin = _currentPasswordController.text;
                      final newPin = _newPasswordController.text;
                      gabCreateUser(pinBaru: int.parse(newPin),pinBaru2: int.parse(confirmPin), pinLama: int.parse(oldPin));
                      _currentPasswordController.clear();
                      _newPasswordController.clear();                      
                      _confirmPasswordController.clear();

                    },
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 50, left: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: MaterialButton(
                    color: const Color(0xFFD9D9D9),
                    onPressed: () {
                      // Menghapus teks pada semua TextField
                      _currentPasswordController.clear();
                      _newPasswordController.clear();
                      _confirmPasswordController.clear();
                    },
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 45, left: 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      

    );

  }

  Future gabCreateUser({required int pinBaru, required int pinBaru2, required int pinLama }) async{
    String insertMail = FirebaseAuth.instance.currentUser!.email!;
    final gabDocUser = FirebaseFirestore.instance.collection('user_form').doc(insertMail.toString());
    QuerySnapshot melihatOldPin = await gabFireCollection.collection('user_form').where('email',isEqualTo: insertMail.toString() ).get();

    int sudahLihatPin = melihatOldPin.docs[0]['pin'];
    
    if (pinLama == sudahLihatPin){
      if (pinBaru == pinBaru2){
        gabDocUser.update(
        {
          'pin': pinBaru,

        }
      );
      _successSnackBar(context);
      } else{
        _failSnackBar(context);
      }
    }
    else{
      _failSnackBar(context);
    }

  }
void _successSnackBar(BuildContext context) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pin Successfully Changed!',
                    style: TextStyle(fontSize: 16, color: Colors.grey[200]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Hapus Snackbar setelah beberapa detik
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

void _failSnackBar(BuildContext context) {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please Recheck Your Pin!',
                    style: TextStyle(fontSize: 16, color: Colors.grey[200]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Hapus Snackbar setelah beberapa detik
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }  

  Widget buildTextField(
      {required TextEditingController controller, required String labelText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 25),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFD9D9D9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          labelText: labelText,
        ),
        obscureText: true,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ],
      ),
    );
  }
}

