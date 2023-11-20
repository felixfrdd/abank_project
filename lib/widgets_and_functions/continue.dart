import 'package:abank_project/bottom_navbar.dart';
import 'package:flutter/material.dart';

class continueButton extends StatelessWidget {
  const continueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
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
    );
  }
}
