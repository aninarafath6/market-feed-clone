import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/widgets/button.dart';
import 'package:marketfeed_clone/common/widgets/inputbox.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/country_code_view_model.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/login_view_model.dart';
import 'package:marketfeed_clone/fetures/authentication/widgets/country_code.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:provider/src/provider.dart';

class OtpAuth extends StatelessWidget {
  const OtpAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var time = context.watch<LoginViewModel>().start;

    return Visibility(
      visible: false,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Login with Mobile Number",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: context.getWidth(4),
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
            context.spacing(height: 2),
            Text(
              'Mobile Number',
              style: GoogleFonts.roboto(
                color: AppColors.textGrey,
                fontSize: context.getWidth(3),
              ),
            ),
            context.spacing(height: 1),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    context.read<CountryCodeViewModel>().updateDropDown(true);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CountryCodes();
                      },
                    ).then(
                      (_) => context
                          .read<CountryCodeViewModel>()
                          .updateDropDown(false),
                    );
                  },
                  child: Text(
                    context
                        .watch<CountryCodeViewModel>()
                        .selectedCountry
                        .dialCode
                        .toString(),
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: context.getWidth(4),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: InputBox(
                    inputLabel: 'enter your mobile number',
                    controller: context.read<LoginViewModel>().controller,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: context.watch<LoginViewModel>().isOtpSent ? true : false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'one time password(OTP)',
                    style: GoogleFonts.roboto(
                      color: AppColors.textGrey,
                      fontSize: context.getWidth(3),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InputBox(
                    inputLabel: '6 digit otp',
                    controller: context.read<LoginViewModel>().smsController,

                    // controller: context.read<LoginViewModel>().controller,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (time == 0) {
                            context.read<LoginViewModel>().verifyPhone(context
                                .read<CountryCodeViewModel>()
                                .selectedCountry
                                .dialCode);
                          }
                        },
                        child: Text(
                          time == 0
                              ? 'Resent'
                              : 'waiting for OTP (resend in $time s) ',
                          style: GoogleFonts.roboto(
                            color: AppColors.textGrey,
                            fontSize: context.getWidth(3),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 10,
                        width: 10,
                        child: time == 0
                            ? const SizedBox()
                            : const CircularProgressIndicator(
                                strokeWidth: 1,
                                color: AppColors.textGrey,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Button(
              label: context.watch<LoginViewModel>().isOtpSent
                  ? 'Submit OTP'
                  : 'Get OTP',
              onTap: () {
                if (context.read<LoginViewModel>().isOtpSent) {
                  context.read<LoginViewModel>().submitOtp(context);
                } else {
                  context.read<LoginViewModel>().updateIsOtpSent(true);
                  context.read<LoginViewModel>().verifyPhone(
                        context
                            .read<CountryCodeViewModel>()
                            .selectedCountry
                            .dialCode,
                      );
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
