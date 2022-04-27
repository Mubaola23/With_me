import 'package:flutter/material.dart';
import 'package:with_me/src/features/authentication/views/activate_biometrics_screen.dart';
import 'package:with_me/src/features/authentication/views/login_screen.dart';
import 'package:with_me/src/features/authentication/views/phone_number_screen.dart';
import 'package:with_me/src/features/authentication/views/preference_screen.dart';
import 'package:with_me/src/features/authentication/views/signup_screen.dart';
import 'package:with_me/src/features/authentication/views/verify_phone_screen.dart';
import 'package:with_me/src/features/dashboard/views/close_alert_screen.dart';
import 'package:with_me/src/features/dashboard/views/request_meet1.dart';
import 'package:with_me/src/features/home/views/home_view.dart';
import 'package:with_me/src/features/startup/view/onboarding_screen.dart';
import 'package:with_me/src/features/startup/view/splash.dart';

class Routes {
  static const login = "/login";
  static const onboarding = "/onboarding";
  static const splash = "/";
  static const signup = "/signup";
  static const activateBiometrics = "/activateBiometrics";
  static const phoneNumber = "/phoneNumber";
  static const verifyPhone = "/verifyPhone";
  static const preferenceScreen = "/preferenceScreen";
  static const home = "/home";
  static const closeAlert = "/closeAlert";
  static const requestMeet1 = "/requestMeet1";

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case activateBiometrics:
        return MaterialPageRoute(
            builder: (_) => const ActivateBiometricsScreen());
      case phoneNumber:
        return MaterialPageRoute(builder: (_) => const PhoneNumberScreen());
      case preferenceScreen:
        return MaterialPageRoute(builder: (_) => const PreferenceScreen());
      case verifyPhone:
        return MaterialPageRoute(builder: (_) => const VerifyPhoneScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreenView());
      case closeAlert:
        return MaterialPageRoute(builder: (_) => const CloseAlertScreen());
      case requestMeet1:
        return MaterialPageRoute(builder: (_) => const RequestMeet1());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Text("No page defined for this route"),
          ),
        );
    }
  }
}
