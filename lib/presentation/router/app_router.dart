import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/constans.dart';
import '../screen/home_screen.dart';
import '../screen/login_screen.dart';
import '../screen/onboarding_screen.dart';
import '../screen/splash_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case homeScreen:
        final Map data = settings.arguments as Map;
        final String myName = data['name'];
        final String myPassword = data['password'];
        if (kDebugMode) {
          print(myPassword);
        }
        return MaterialPageRoute(builder: (_) => HomeScreen(myName: myName,));
      default:
        return null;
    }
  }
}