import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreUserForm {
  final FirebaseFirestore _firestoreForm = FirebaseFirestore.instance;

  Future storeUserForm(User user, String fullName, String username,
      String email, String pin, String accNum) async {
    await _firestoreForm.collection('user_form').doc(email).set({
      'uid': user.uid,
      'fullName': fullName,
      'username': username,
      'email': email,
      'pin': pin,
      'accNum': accNum,
    });
  }

  Future getEmailFromFirestore(String username, BuildContext context) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('username', isEqualTo: username)
        .get();
    if (query.docs.isNotEmpty) {
      String email = query.docs[0]['email'];
      return email;
    } else {
      showErrorSnackBar(context, 'Incorrect username or password');
    }
  }

  Future<String> getAccNumFromFirestoreWithEmail(String email) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('email', isEqualTo: email)
        .get();
    String accNum = query.docs[0]['accNum'];
    return accNum;
  }

  Future<bool> isAvailableUsername(
      String username, BuildContext context) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('username', isEqualTo: username)
        .get();
    if (query.docs.isEmpty) {
      return true;
    }
    showErrorSnackBar(context, 'Username not available');
    return false;
  }

  Future<bool> isNotUniqueAccountNumber(String accNum) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('accNum', isEqualTo: accNum)
        .get();
    if (query.docs.isEmpty) {
      return false;
    }
    return true;
  }
}
