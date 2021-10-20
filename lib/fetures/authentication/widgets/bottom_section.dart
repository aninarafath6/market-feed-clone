import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/widgets/button.dart';
import 'package:marketfeed_clone/common/widgets/inputbox.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/country_code_view_model.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/login_view_model.dart';
import 'package:marketfeed_clone/fetures/authentication/widgets/country_code.dart';
import 'package:marketfeed_clone/fetures/authentication/widgets/otp_auth.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class BottomSection extends StatelessWidget {
  BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      height: context
          .getHeight(context.watch<LoginViewModel>().isOtpSent ? 45 : 33),
      width: context.getWidth(100),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OtpAuth(),
          Text(
            "Setup your account",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: context.getWidth(5),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'All your stock market needs in one place',
            style: GoogleFonts.roboto(
              color: AppColors.textGrey,
              fontSize: context.getWidth(3),
            ),
          ),
          const Spacer(),
          InputBox(
            inputLabel: 'Username',
            controller: context.read<LoginViewModel>().smsController,

            // controller: context.read<LoginViewModel>().controller,
          ),
          const Spacer(),
          InputBox(
            inputLabel: 'Email',
            controller: context.read<LoginViewModel>().smsController,

            // controller: context.read<LoginViewModel>().controller,
          ),
          const Spacer(),
          const Button(
            label: 'Continue',
          ),
        ],
      ),
    );
  }
}
