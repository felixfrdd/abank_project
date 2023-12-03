import 'package:abank_project/firebase/firestore_user_form.dart';
import 'package:abank_project/widgets_and_functions/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationWelcomePage extends StatefulWidget {
  const RegistrationWelcomePage({super.key});

  @override
  State<RegistrationWelcomePage> createState() =>
      _RegistrationWelcomePageState();
}

class _RegistrationWelcomePageState extends State<RegistrationWelcomePage> {
  final FirestoreUserForm _firestoreForm = FirestoreUserForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  //logo
                  Image.asset(
                    'images/logo.png',
                    width: 360,
                    height: 243,
                  ),
                  const Icon(
                    Icons.check_circle_outline_outlined,
                    size: 120.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Hooray! Account created\nReady to do banking?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Your account number is',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<String?>(
                    future: _firestoreForm.getAccNumFromFirestoreWithEmail(
                      FirebaseAuth.instance.currentUser!.email!,
                    ),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      child: const Text(
                        'Continue >',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
