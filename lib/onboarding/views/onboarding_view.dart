import 'package:flutter/material.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/constants/app_images.dart';
import 'package:marketfeed_clone/onboarding/views/widgets/button.dart';
import 'package:marketfeed_clone/onboarding/views/widgets/onboarding_paging.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      right: 0,
                      top: 50,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Image.asset(
                        AppImages.doutImage,
                        width: 70,
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 20,
                      child: Image.asset(
                        AppImages.doutImage,
                        width: 70,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: OnboardingPaging(),
                    )
                  ],
                ),
              ),
              Button(label: 'Next', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
