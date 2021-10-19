import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/constants/app_images.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/country_code_view_model.dart';
import 'package:marketfeed_clone/fetures/authentication/widgets/bottom_section.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:provider/src/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      final shouldPop = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.grey,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exit',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Are you sure you want to exit?',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'NO',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );

      return shouldPop ?? false;
    }

    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      resizeToAvoidBottomInset:
          !context.watch<CountryCodeViewModel>().isDropDownOpen,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Column(
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
      ),
    );
  }
}
