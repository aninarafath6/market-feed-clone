import 'package:flutter/material.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/constants/app_images.dart';
import 'package:marketfeed_clone/fetures/authentication/widgets/bottom_section.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';

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
            title: const Text('Exit'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('YES'),
              ),
            ],
          );
        },
      );

      return shouldPop ?? false;
    }

    return Scaffold(
      backgroundColor: AppColors.darkGrey,
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
