import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserNewBankAccount {
  final FirebaseFirestore _firestoreForm = FirebaseFirestore.instance;

  Future<bool> isAvailableNewAccNum(String email, String accNum) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('email', isEqualTo: email)
        .where('saved_account_numbers', arrayContains: accNum)
        .get();

    if (query.docs.isEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> isMyOwnAccountNumber(String email, String accNum) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('email', isEqualTo: email)
        .get();

    if (query.docs[0]['accNum'] == accNum) {
      return true;
    }
    return false;
  }

  Future<bool> isAccNumNotExistInCurrentUser(
      String accNum, String email) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .doc(email)
        .collection('saved_accNumbers')
        .where('accNum', isEqualTo: accNum)
        .get();
    if (query.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future whoseAccNumber(String accNum) async {
    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('accNum', isEqualTo: accNum)
        .get();
    if (query.docs.isNotEmpty) {
      String accNum = query.docs[0]['email'];
      return accNum;
    }
  }

  Future storeNewAccount(
      String email, String emailOthers, String accNum) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('user_form');
    DocumentReference userDocument = usersCollection.doc(email);
    CollectionReference savedNumbersCollection =
        userDocument.collection('saved_accNumbers');

    QuerySnapshot query = await _firestoreForm
        .collection('user_form')
        .where('accNum', isEqualTo: accNum)
        .get();
    String fullName = query.docs[0]['fullName'];
    Map<String, String> data = {
      'accNum': accNum,
      'email': emailOthers,
      'fullName': fullName,
    };
    await savedNumbersCollection.doc(emailOthers).set(data);
  }

  Future<List<Map<String, String>>> getAddedAccount(String email) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('user_form');
    DocumentReference adminDocument = usersCollection.doc(email);
    CollectionReference savedNumbersCollection =
        adminDocument.collection('saved_accNumbers');
    QuerySnapshot querySnapshot = await savedNumbersCollection.get();
    List<Map<String, String>> resultList = [];
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        Map<String, String> result = {
          'accNum': data['accNum']?.toString() ?? '',
          'fullName': data['fullName']?.toString() ?? '',
        };
        resultList.add(result);
      }
    }
    return resultList;
  }
}
