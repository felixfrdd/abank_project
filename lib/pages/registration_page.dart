import 'package:abank_project/components/createAcc.dart';
import 'package:abank_project/components/textfield.dart';
import 'package:abank_project/pages/login_page.dart';

import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[700],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              Image.asset(
                'images/logo.png',
                width: 360,
                height: 200,
              ),

              //welcomeback
              const Text(
                'Hi there!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Let\'s Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              MyTextField(
                controller: fullNameController,
                hintText: 'Enter your full name',
                icon: null,
              ),

              const SizedBox(
                height: 10,
              ),

              MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                icon: null,
              ),

              const SizedBox(
                height: 10,
              ),

              MyTextField(
                controller: passwordController,
                hintText: 'Enter password',
                icon: null,
              ),

              const SizedBox(
                height: 10,
              ),

              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                icon: null,
              ),

              const SizedBox(
                height: 20,
              ),

              createAcc(),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account? ',
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
                                LoginPage()), // Ganti dengan halaman pendaftaran yang sesuai
                      );
                    },
                    child: const Text(
                      'Login',
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
