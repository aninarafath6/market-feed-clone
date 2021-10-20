import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    UserCredential userCredential = await _auth.signInWithCredential(credential);

    if (userCredential.user!.email == null) {
      

    }else{

    }
    return userCredential;
  }
}
