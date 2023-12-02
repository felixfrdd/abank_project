import 'package:abank_project/firebase/firebase_auth_user.dart';
import 'package:abank_project/pages/form_login_regist/forgot_password_page.dart';
import 'package:abank_project/pages/form_login_regist/registration_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
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

                    const SizedBox(
                      height: 10,
                    ),

                    //welcomeback
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Please, Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //username
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          if (email != null &&
                              !EmailValidator.validate(email)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            size: 28,
                            color: Colors.black,
                          ),
                          hintText: 'Email',
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          contentPadding: const EdgeInsets.all(20.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 56, 56, 56)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 56, 56, 56)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: TextFormField(
                        autofocus: false,
                        controller: _passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null && value.length < 6) {
                            return 'Minimum 6 characters required';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: Color(0xFF000000),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:
                            !_passwordVisible, //This will obscure text dynamically
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            size: 28,
                            color: Colors.black,
                          ),
                          hintText: 'Password',
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          contentPadding: const EdgeInsets.all(20.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 56, 56, 56)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 56, 56, 56)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorStyle: const TextStyle(fontSize: 15),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            splashColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //continue
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: _login,
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

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Create Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Future _login() async {
    final isValid = _formKey.currentState!.validate();
    //TODO: username to Firebase
    //TODO: username with validator?.
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    User? user =
        await _auth.loginWithEmailAndPassword(email, password, context);
    if (user != null) {
      if (!isValid) return;
      Navigator.pop(context);
    }
  }
}
