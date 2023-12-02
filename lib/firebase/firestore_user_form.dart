import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreUserForm {
  final FirebaseFirestore _firestoreForm = FirebaseFirestore.instance;

  Future storeUserForm(
      User user, String fullName, String username, String email) async {
    await _firestoreForm
        .collection('users')
        .doc(email)
        .collection('info')
        .doc('form')
        .set({
      'uid': user.uid,
      'fullName': fullName,
      'username': username,
      'email': email,
    });
  }

  Future getEmailFromFirestore(String username, BuildContext context) async {
    QuerySnapshot query = await _firestoreForm
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    if (query.docs.isNotEmpty) {
      String email = query.docs[0]['email'] as String;
      return email;
    } else {
      showErrorSnackBar(context, 'Incorrect username or password');
    }
  }
}
