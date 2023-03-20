import 'package:Eiger/lib.dart';
import 'package:Eiger/modules/on_boarding/page/on_boarding_view.dart';
import 'package:flutter/material.dart';

const routeLogin = "/login";
const routeOnBoarding = "/onBoarding";
const routeHome = "/home";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeLogin:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case routeOnBoarding:
      return CustomPageRoute(
        OnBoardingView(),
      );
    case routeHome:
      return CustomPageRoute(
        HomeView(),
      );
  }
  return MaterialPageRoute(
    builder: (context) => SplashScreenView(),
  );
}

Map<String, Widget Function(BuildContext context)> routes = {
  // ModalRoute.of(context)!.settings.arguments as
  routeLogin: (context) => LoginView(),
};
