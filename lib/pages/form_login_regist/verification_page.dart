import 'dart:async';
import 'package:abank_project/firebase/firestore_user_form.dart';
import 'package:abank_project/widgets_and_functions/bottom_navbar.dart';
import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool isEmailVerified = false;
  bool canResendLink = false;
  Timer? timer;
  final FirestoreUserForm _firestoreForm = FirestoreUserForm();

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    if (mounted) {
      setState(() {
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });
    }
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      if (mounted) {
        setState(
          () => canResendLink = false,
        );
      }
      await Future.delayed(
        const Duration(seconds: 5),
      );
      if (mounted) {
        setState(
          () => canResendLink = true,
        );
      }
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(context, e.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _firestoreForm.isRegisteredUser(
        FirebaseAuth.instance.currentUser!.email!,
      ),
      builder: (context, snapshot) {
        bool isUserRegistered = snapshot.data ?? false;
        print(snapshot.data);
        if (snapshot.data == true && isEmailVerified) {
          return const BottomNavbar();
        } else if (snapshot.data == false && isEmailVerified) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
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
                          future:
                              _firestoreForm.getAccNumFromFirestoreWithEmail(
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
                            onPressed: () async => {
                              await _firestoreForm.markUserAsRegistered(
                                  FirebaseAuth.instance.currentUser!.email!),
                              setState(() {})
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
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFF363636),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 360,
                      height: 243,
                    ),
                    Image.asset(
                      'images/email-w.png',
                      width: 340,
                      height: 223,
                    ),
                    const Text(
                      'Verification Sent',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Please verify your Email',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                        onPressed: canResendLink ? sendVerificationEmail : null,
                        child: const Text(
                          'Resend Verification Link',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: SizedBox(
                        child: TextButton.icon(
                          icon: const Icon(Icons.cancel),
                          label: const Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          onPressed: () => {
                            FirebaseAuth.instance.signOut(),
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
