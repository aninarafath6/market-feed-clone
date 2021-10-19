import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/widgets/button.dart';
import 'package:marketfeed_clone/common/widgets/inputbox.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/country_code_view_model.dart';
import 'package:marketfeed_clone/fetures/authentication/widgets/country_code.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:provider/src/provider.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
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
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CountryCodes();
                    },
                  );
                },
                child: Text(
                  context
                      .watch<CountryCodeViewModel>()
                      .selectedCountry
                      .dialCode
                      .toString(),
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(width: 50),
              const Expanded(
                child: InputBox(
                  inputLabel: 'enter your mobile number',
                ),
              ),
            ],
          ),
          const Spacer(),
          Button(
            label: 'Get OTP',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
