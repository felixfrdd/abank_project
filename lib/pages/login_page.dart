import 'package:abank_project/components/continue.dart';
import 'package:abank_project/components/textfield.dart';
import 'package:abank_project/pages/registration_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF363636),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              Image.asset(
                'images/logo.png',
                width: 360,
                height: 243,
              ),

              const SizedBox(
                height: 30,
              ),

              //welcomeback
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Please, Log In.',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //username
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                icon: Icons.person_outline,
              ),

              const SizedBox(
                height: 20,
              ),

              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
              ),

              const SizedBox(
                height: 30,
              ),

              //continue
              const continueButton(),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegistrationPage()), // Ganti dengan halaman pendaftaran yang sesuai
                      );
                    },
                    child: const Text(
                      'Create Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
