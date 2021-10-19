import 'package:flutter/material.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/constants/app_images.dart';
import 'package:marketfeed_clone/fetures/authentication/view/login_view.dart';
import 'package:marketfeed_clone/fetures/onboarding/view_models/onboarding_view_model.dart';
import 'package:marketfeed_clone/common/widgets/button.dart';

import 'package:marketfeed_clone/fetures/onboarding/widgets/onboarding_paging.dart';
import 'package:marketfeed_clone/utils/navigation.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    var listenedProvider = context.watch<OnboardingViewModel>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 24,
                      left: 20,
                      child: Image.asset(
                        AppImages.dotImage,
                        width: 70,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 20,
                      child: Image.asset(
                        AppImages.dotImage,
                        width: 70,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: OnboardingPaging(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          debugPrint('skip');
                          context.toPushNamedReplacement(LoginView.routeName);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Button(
                label: context.watch<OnboardingViewModel>().isLastPage
                    ? 'Get Started'
                    : 'Next',
                onTap: () {
                  listenedProvider.isLastPage
                      ? context.toPushNamedReplacement(LoginView.routeName)
                      : context.read<OnboardingViewModel>().nextPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
