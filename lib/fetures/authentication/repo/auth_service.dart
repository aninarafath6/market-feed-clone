import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(email, displayName) {
    return users
        // existing document in 'users' collection: "ABC123"
        .doc(_auth.currentUser!.uid)
        .set(
          {
            'email': email,
            'displayName': displayName,
            'phone': _auth.currentUser!.phoneNumber,
            'uid': _auth.currentUser!.uid,
          },
          SetOptions(merge: true),
        )
        .then(
          (value) => print("'full_name' & 'age' merged with existing data!"),
        )
        .catchError(
          (error) => print("Failed to merge data: $error"),
        );
  }

  Future<void> verifyWithPhone(String phone,
      {required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          print('verification complicated');
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<UserCredential> signInWithPhone(String vi, String sms) async {
    AuthCredential credential =
        PhoneAuthProvider.credential(verificationId: vi, smsCode: sms);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    return userCredential;
  }

  void setupAccount(email, displayName) async {}
}
