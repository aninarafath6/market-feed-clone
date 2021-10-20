import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketfeed_clone/fetures/authentication/repo/auth_service.dart';
import 'package:marketfeed_clone/fetures/home/views/home_view.dart';
import 'package:marketfeed_clone/utils/navigation.dart';

class LoginViewModel with ChangeNotifier {
  late String verificationCode;
  bool _isOtpSent = false;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  int start = 60;

  TextEditingController get controller => _controller;
  TextEditingController get smsController => _smsController;

  bool get isOtpSent => _isOtpSent;
  // int get time => _start;

  void verifyPhone(String dailcode) async {
    int start = 60;

    String phone = dailcode + _controller.text;
    AuthService().verifyWithPhone(
      phone,
      codeSent: (vi, token) async {
        startTimer();
        updateIsOtpSent(true);
        verificationCode = vi;
      },
      codeAutoRetrievalTimeout: (vi) {
        // start = 60;
        // startTimer();
        // verificationCode = vi;
      },
    );
  }

  void updateIsOtpSent(bool status) {
    _isOtpSent = status;
    notifyListeners();
  }

  void startTimer() {
    Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    UserCredential userCredential = await AuthService()
        .signInWithPhone(verificationCode, _smsController.text);

    if (userCredential.user!.email == null) {
      
    } else {
      context.toNamed(HomeView.routeName);
    }
  }
}
