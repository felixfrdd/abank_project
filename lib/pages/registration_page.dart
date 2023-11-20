import 'package:flutter/material.dart';
import 'package:abank_project/widgets_and_functions/createAcc.dart';
import 'package:abank_project/widgets_and_functions/textfield.dart';
import 'package:abank_project/pages/login_page.dart';
import 'package:flutter/services.dart';

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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 56, 56, 56)),
                      ),
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: const Visibility(
                        visible:
                            false, // Set visible ke false untuk menyembunyikan ikon
                        child: Icon(
                          Icons
                              .lock_outline, // Ikon yang ingin Anda sembunyikan
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
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
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
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
      ),
    );
  }
}
