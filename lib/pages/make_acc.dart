import 'package:abank_project/widgets_and_functions/bottom_navbar.dart';
import 'package:flutter/material.dart';

class make_acc extends StatefulWidget {
  make_acc({super.key});

  @override
  State<make_acc> createState() => _make_accState();
}

class _make_accState extends State<make_acc> {
  bool _passwordVisible = true;

  // Toggles the password show status
  void initState() {
    _passwordVisible = false;
  }

  @override
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

                //welcomeback
                const Text(
                  'Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration
                            .none), // Set warna teks menjadi putih
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Colors.white), // Warna underline menjadi putih
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Warna underline saat fokus menjadi putih
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.white, decoration: TextDecoration.none),
                    keyboardType: TextInputType.text,
                    obscureText:
                        !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Warna underline saat fokus menjadi putih
                      ),
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        splashColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavbar(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Text(
                      'Next',
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
    );
  }
}
