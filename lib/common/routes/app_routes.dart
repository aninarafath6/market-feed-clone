import 'package:flutter/material.dart';
import 'package:marketfeed_clone/onboarding/views/onboarding_view.dart';

class AppRoutes {
 static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
    }
  }
}
