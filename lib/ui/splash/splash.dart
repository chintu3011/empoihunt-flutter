import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../onboarding/on_boarding.dart';
import '../utils/theme/app_assets.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
                PageTransition(child: const OnBoarding(), type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 700))
                // MaterialPageRoute(builder: (context) => const OnBoarding())
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(AppAssets.appLogo,)),
    );
  }
}
