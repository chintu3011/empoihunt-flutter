import 'dart:async';
import 'package:emploiflutter/frame_work/controller/splash_controller/splash_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:page_transition/page_transition.dart';
import '../authentication/auth_intro.dart';
import '../onboarding/on_boarding.dart';
import '../utils/app_constant.dart';
import '../utils/theme/app_assets.dart';


class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splashController).getSplashData();
      // ref.read(splashController).checkUserOpenAppFirstTime(context);
    });
    Timer(
        const Duration(seconds: 3),
            (){
              ref.read(splashController).checkUserOpenAppFirstTime(context);
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
