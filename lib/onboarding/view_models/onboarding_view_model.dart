import 'package:flutter/material.dart';
import 'package:marketfeed_clone/onboarding/models/onboarding_model.dart';

class OnboardingViewModel with ChangeNotifier {
  final List<OnboardingModel> onboardingData = <OnboardingModel>[
    OnboardingModel(
      title: 'noise-free\n& curated',
      subtitle: 'market insights',
      icon: 'assets/images/onboarding_icon.png',
    ),
    OnboardingModel(
      title: 'track Indian\n& global markets',
      subtitle: 'with live data',
      icon: 'assets/images/onboarding2.png',
    ),
    OnboardingModel(
      title: 'SEBI\nregisterd advisory',
      subtitle: 'trade with confidence',
      icon: 'assets/images/onboarding3.png',
    ),
    OnboardingModel(
      title: 'indraday\nscreens',
      subtitle: 'with live market data',
      icon: 'assets/images/onboarding4.png',
    ),
    OnboardingModel(
      title: 'engange in\nthe market',
      subtitle: 'wiht live speed',
      icon: 'assets/images/onboarding5.png',
    ),
  ];
}
