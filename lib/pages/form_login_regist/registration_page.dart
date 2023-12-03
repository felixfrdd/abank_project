import 'package:abank_project/firebase/firebase_auth_user.dart';
import 'package:abank_project/firebase/firestore_user_form.dart';
import 'package:abank_project/widgets_and_functions/build_back_button.dart';
import 'package:abank_project/widgets_and_functions/generate_random.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = true;
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  final FirestoreUserForm _firestoreForm = FirestoreUserForm();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: buildBackButton(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    height: 80,
                  ),

                  //welcomeback
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextFormField(
                      controller: _fullNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (fullName) {
                        RegExp regex = RegExp(r'^[a-zA-Z ]+$');
                        if (fullName == null || fullName.isEmpty) {
                          return 'Full Name is required';
                        }
                        if (!regex.hasMatch(fullName)) {
                          return 'Full Name can only contain letters and spaces';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          size: 28,
                          color: Colors.black,
                        ),
                        hintText: 'Full Name',
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        contentPadding: const EdgeInsets.all(15.0),
                        isCollapsed: true,
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
                        errorMaxLines: 2,
                        errorStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextFormField(
                      controller: _usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (username) {
                        RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
                        if (username == null || username.isEmpty) {
                          return 'Username is required';
                        }
                        if (!regex.hasMatch(username)) {
                          return 'Username can only contain letters and numbers';
                        }
                        if (username.length < 3 || username.length > 8) {
                          return 'Username must be between 3 to 8 characters';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.assignment_ind_outlined,
                          size: 28,
                          color: Colors.black,
                        ),
                        hintText: 'Username',
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        contentPadding: const EdgeInsets.all(15.0),
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
                        errorMaxLines: 2,
                        errorStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        if (email != null && !EmailValidator.validate(email)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 28,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        contentPadding: const EdgeInsets.all(15.0),
                        isCollapsed: true,
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
                        errorMaxLines: 2,
                        errorStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextFormField(
                      autofocus: false,
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Password is required';
                        }
                        if (password.length < 6) {
                          return 'Password must be 6 characters or more';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Color(0xFF000000),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: !_passwordVisible,
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
                        contentPadding: const EdgeInsets.all(15.0),
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
                        errorMaxLines: 2,
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

                  const SizedBox(height: 15),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: TextFormField(
                      autofocus: false,
                      controller: _pinController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (pin) {
                        if (pin == null || pin.isEmpty) {
                          return 'PIN is required';
                        }
                        if (pin.length < 6) {
                          return '6 digit PIN required';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Color(0xFF000000),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6)
                      ],
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.pin_outlined,
                          size: 28,
                          color: Colors.black,
                        ),
                        hintText: 'PIN',
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        contentPadding: const EdgeInsets.all(15.0),
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
                        errorMaxLines: 2,
                        errorStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: ElevatedButton(
                      onPressed: _register,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _register() async {
    final isValidForm = _formKey.currentState!.validate();
    String fullName = _fullNameController.text;
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    int pin = int.parse(_pinController.text.trim());
    String accNum = '';
    bool isNotUniqueAccNum = true;
    bool isAvailableUsername =
        await _firestoreForm.isAvailableUsername(username, context);
    if (!isValidForm || !isAvailableUsername) return;
    User? user =
        await _auth.registerWithEmailAndPassword(email, password, context);
    if (user != null) {
      while (isNotUniqueAccNum) {
        accNum = RandomTenDigitAccount().generateRandomNumber();
        isNotUniqueAccNum =
            await _firestoreForm.isNotUniqueAccountNumber(accNum);
      }
      await _firestoreForm.storeUserForm(
          user, fullName, username, email, pin, accNum);
      Navigator.pop(context);
    }
  }
}
