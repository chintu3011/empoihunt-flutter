import 'dart:async';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/authentication/auth_intro.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
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
            (){
          if(SharedPrefServices.services.getBool(onBoardingKey)){
            Navigator.pushReplacement(
                context,
                PageTransition(child: const AuthIntro(), type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 700))
              // MaterialPageRoute(builder: (context) => const OnBoarding())
            );
          }else{
            Navigator.pushReplacement(
                context,
                PageTransition(child: const OnBoarding(), type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 700))
            );
          }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(AppAssets.appLogo,)),
    );
  }
}
