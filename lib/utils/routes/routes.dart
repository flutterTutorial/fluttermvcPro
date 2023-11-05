import 'package:flutter/material.dart';
import 'package:mvm/utils/routes/routes_name.dart';
import 'package:mvm/view/home_screen.dart';
import 'package:mvm/view/login_screen.dart';
import 'package:mvm/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      default:
        throw MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No Route Defined")),
          );
        });
    }
  }
}
