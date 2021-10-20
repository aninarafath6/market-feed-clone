import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketfeed_clone/fetures/authentication/repo/auth_service.dart';
import 'package:marketfeed_clone/fetures/authentication/repo/data_base_service.dart';
import 'package:marketfeed_clone/fetures/home/views/home_view.dart';
import 'package:marketfeed_clone/utils/navigation.dart';

class LoginViewModel with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  late String verificationCode;
  bool _isOtpSent = false;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  late BuildContext context;
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  bool isAccountSetup = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int start = 60;

  TextEditingController get controller => _controller;
  TextEditingController get smsController => _smsController;
  TextEditingController get emailController => _emailController;
  TextEditingController get usernameController => _usernameController;
  bool get loading => _loading;

  GlobalKey get formKey => _formKey;

  bool get isOtpSent => _isOtpSent;
  // int get time => _start;

  void verifyPhone(String dailcode) async {
    int start = 60;
    startTimer();

    String phone = dailcode + _controller.text;
    AuthService().verifyWithPhone(
      phone,
      codeSent: (vi, token) async {
        updateIsOtpSent(true);
        verificationCode = vi;
      },
      codeAutoRetrievalTimeout: (vi) {},
    );
  }

  void updateIsOtpSent(bool status) {
    _isOtpSent = status;
    notifyListeners();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        start--;
        notifyListeners();
      }
    });

    print(start);
  }

  Future<void> submitOtp(BuildContext context) async {
    this.context = context;
    UserCredential userCredential = await AuthService()
        .signInWithPhone(verificationCode, _smsController.text);
    DatabaseService().setUser(userCredential.user!.uid);
    var email = await users.doc(_auth.currentUser!.uid).get();

    if (email.data() == null) {
      isAccountSetup = true;
      _isOtpSent = false;
      notifyListeners();
    } else {
      context.toPushNamedReplacement(HomeView.routeName);
    }
  }

  void accountSetup() async {
    if (_formKey.currentState!.validate()) {
      _loading = true;
      await AuthService()
          .addUser(_emailController.text, _usernameController.text);
      // context.toPushNamedReplacement(HomeView.routeName);
      _loading = false;
    }
  }
}
