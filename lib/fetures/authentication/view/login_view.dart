import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/constants/app_images.dart';
import 'package:marketfeed_clone/common/widgets/button.dart';
import 'package:marketfeed_clone/fetures/authentication/models/country_dropdown.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/drop_down_view_model.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:provider/src/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              AppImages.logo,
              width: context.getWidth(50),
            ),
          ),
          const Spacer(),
          const BottomSection(),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      height: context.getHeight(32),
      width: context.getWidth(100),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Login with Mobile Number",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'All your stock market needs in one place',
            style: GoogleFonts.roboto(
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Mobile Number',
            style: GoogleFonts.roboto(
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Text(
                '+91'.toString(),
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.roboto(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'enter your mobile number',
                    hintStyle: GoogleFonts.roboto(
                      color: AppColors.textGrey,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textGrey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.yellow,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Button(
            label: 'Get OTP',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
