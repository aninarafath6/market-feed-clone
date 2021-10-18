import 'package:flutter/material.dart';
import 'package:marketfeed_clone/fetures/authentication/view/login_view.dart';
import 'package:marketfeed_clone/fetures/onboarding/views/onboarding_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
    }
  }
}
