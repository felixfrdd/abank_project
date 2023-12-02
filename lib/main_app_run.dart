import 'package:abank_project/pages/initial_screen/ScreenAwal.dart';
import 'package:abank_project/pages/form_login_regist/verification_page.dart';
import 'package:abank_project/widgets_and_functions/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future <void> main() async{
  await Supabase.initialize(
    url: 'https://rrppzilkstebmxvxcfor.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJycHB6aWxrc3RlYm14dnhjZm9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEwNjg0MDYsImV4cCI6MjAxNjY0NDQwNn0.v3ODAKrRrQm8nosDYp_EHieoMeOTc7Royafrj2Fh3vU',
    
  );

<<<<<<< HEAD
=======
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
>>>>>>> 09db7623c834b69193f0bcfc91feffff75b0d386
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

              // return const VerificationPage();
              return const BottomNavbar();
            } else {
              return const MyCarousel();
            }
          }),
    ),
  );
}

final supabase = Supabase.instance.client;
