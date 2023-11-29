import 'package:abank_project/pages/verif_page.dart';
import 'package:flutter/material.dart';
import 'package:abank_project/widgets_and_functions/continue.dart';
import 'package:abank_project/widgets_and_functions/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => verif_page(),
                          ),
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
      ),
    );
  }
}
