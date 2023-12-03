import 'package:abank_project/pages/initial_screen/ScreenAwal.dart';
import 'package:abank_project/pages/form_login_regist/verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: const Color(0xFF363636),
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Colors.grey,
            selectionHandleColor: Color.fromARGB(255, 123, 122, 122),
            cursorColor: Colors.grey,
          )),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //TODO: uncomment return VerificationPage buat aktifin email verification
              return const VerificationPage();
              // return const BottomNavbar();
            } else {
              return const MyCarousel();
            }
          }),
    ),
  );
}
