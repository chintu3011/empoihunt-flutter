import 'package:emploiflutter/ui/app_routes/route_key.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../splash/splash.dart';

class RoutesManager {
  static Route onGenerateRoutes(RouteSettings settings) {
    // final args = settings.arguments as Map<String, dynamic>?;

    // final isFromFilter = args?["isFromFilterKey"] ?? false;
    // final isFromSearch = args?["isFromSearchKey"] ?? false;

    switch (settings.name) {
      case RouteKey.splash:
        return PageTransition(
            child: const Splash(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 500));
      default:
        return MaterialPageRoute(
            builder: (context) => const Material(
                child: Center(child: Text('Something Went Wrong'))));
    }
  }
}
