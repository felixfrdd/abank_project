import 'package:abank_project/widgets_and_functions/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreUserForm {
  final FirebaseFirestore _firestoreForm = FirebaseFirestore.instance;

  Future storeUserForm(User user, String fullName, String username,
      String email, int pin, String accNum) async {
    await _firestoreForm.collection('user_form').doc(email).set({
      'uid': user.uid,
      'fullName': fullName,
      'username': username,
      'email': email,
      'pin': pin,
      'accNum': accNum,
      'registered': false,
      'balance': 1000000
    });
  }

  Future<void> markUserAsRegistered(String email) async {
    await _firestoreForm.collection('user_form').doc(email).update({
      'registered': true,
    });
  }

  Future<bool> isRegisteredUser(String email) async {
    DocumentSnapshot userSnapshot =
        await _firestoreForm.collection('user_form').doc(email).get();

    if (userSnapshot.exists) {
      bool isRegistered = userSnapshot.get('registered') ?? false;
      return isRegistered;
    } else {
      return false;
    }
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

  Future getBalance(String email) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('email', isEqualTo: email)
        .get();
    if (query.docs.isNotEmpty) {
      num balance = query.docs[0]['balance'];
      return balance;
    }
  }

  Future getFullName(String email) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('email', isEqualTo: email)
        .get();
    if (query.docs.isNotEmpty) {
      String fullName = query.docs[0]['fullName'];
      return fullName;
    }
  }

  Future<String> getAccNumFromFirestoreWithEmail(String email) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('email', isEqualTo: email)
        .get();
    if (query.docs.isNotEmpty) {
      String accNum = query.docs[0]['accNum'];
      return accNum;
    }
    return '';
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
