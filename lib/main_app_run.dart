import 'package:abank_project/pages/initial_screen/ScreenAwal.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future <void> main() async{
  await Supabase.initialize(
    url: 'https://rrppzilkstebmxvxcfor.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJycHB6aWxrc3RlYm14dnhjZm9yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEwNjg0MDYsImV4cCI6MjAxNjY0NDQwNn0.v3ODAKrRrQm8nosDYp_EHieoMeOTc7Royafrj2Fh3vU',
    
  );

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
      home: const MyCarousel(),
    ),
  );
}

final supabase = Supabase.instance.client;
