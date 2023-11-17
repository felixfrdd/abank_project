import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final IconData? icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.hintText == 'Password' ||
                widget.hintText == 'Enter password' ||
                widget.hintText == 'Confirm password'
            ? isSecurePassword
            : false,
        keyboardType: widget.hintText == 'Password'
            ? TextInputType.text
            : TextInputType.visiblePassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 56, 56, 56)),
          ),
          fillColor: const Color(0xFFD9D9D9),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          suffixIcon: togglePassword(),
          prefixIcon: Icon(
            widget.icon,
            size: 28,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    if (widget.hintText == 'Password' ||
        widget.hintText == 'Enter password' ||
        widget.hintText == 'Confirm password') {
      return IconButton(
        onPressed: () {
          setState(() {
            isSecurePassword = !isSecurePassword;
          });
        },
        icon: isSecurePassword
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
        color: Colors.grey,
        splashColor: Colors.transparent,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
