import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/fetures/onboarding/view_models/onboarding_view_model.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:provider/src/provider.dart';

class OnboardingPaging extends StatelessWidget {
  const OnboardingPaging({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<OnboardingViewModel>();

    return PageView.builder(
      controller:provider.pageController,
      onPageChanged:provider.updateIndex,
      physics:const BouncingScrollPhysics(),
      itemCount: provider.onboardingData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                provider.onboardingData[index].icon!,
                width: context.getHeight(10),
              ),
              const SizedBox(height: 40),
              Text(
                provider.onboardingData[index].title!,
                style: GoogleFonts.roboto(
                  fontSize: context.getWidth(10),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              context.spacing(height: 2),
              Text(
                provider.onboardingData[index].subtitle!,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: context.getWidth(6),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
