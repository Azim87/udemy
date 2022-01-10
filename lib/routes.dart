import 'package:flutter/material.dart';
import 'package:udemy/presentation/forgot_password/forgot_password.dart';
import 'package:udemy/presentation/login/login_sceen.dart';
import 'package:udemy/presentation/onboard/onboard_screen.dart';
import 'package:udemy/presentation/register/register_screen.dart';
import 'package:udemy/presentation/splash/splash_screen.dart';
import 'package:udemy/presentation/store/store_screen.dart';
import 'package:udemy/res/strings.dart';

class Routes {
  static const String splash = '/';
  static const String onBoard = 'onboard';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotPassword';
  static const String main = 'main';
  static const String storeDetail = 'storeDetail';
  static const String notfound = 'notfound';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoard:
        return MaterialPageRoute(builder: (_) => const OnboardScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.storeDetail:
        return MaterialPageRoute(builder: (_) => const StoreScreen());
    }
    return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text(AppStrings.noPageFound))));
  }
}
