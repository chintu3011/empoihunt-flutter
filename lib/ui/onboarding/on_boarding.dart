
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:flutter/scheduler.dart';

import '../utils/theme/app_assets.dart';
import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';
import 'controller/on_boarding_controller.dart';
import 'helper/intro_appbar.dart';
import 'helper/on_boarding_next_button.dart';
import 'helper/pages/intro_pages.dart';

class OnBoarding extends ConsumerStatefulWidget {
  const OnBoarding({super.key});

  @override
  ConsumerState<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends ConsumerState<OnBoarding> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async{
      await SharedPrefServices.services.setBool(onBoardingKey, true);
    });

  }
  @override
  Widget build(BuildContext context,) {
    final introViewWatch = ref.watch(onBoardingController);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.colors.blueColors,
      appBar: const IntroAppbar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment:  Alignment.center,
                height: size.height * 0.75,
                width:  size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.r),bottomLeft: Radius.circular(50.r))
                ),
                child: PageView(
                  controller: introViewWatch.pageController,
                  onPageChanged: (val){
                    introViewWatch.onPageChange(val);
                    SharedPrefServices.services.setBool(onBoardingKey, true);
                  },
                  children: const [
                    IntroPageView(model: (img: AppAssets.image1,title: "Welcome to EmploiHunt",subtile: "Discover your ideal job here")),
                    IntroPageView(model: (img: AppAssets.image2,title: "Recruit best employee",subtile: "Employ the best talent more quickly with Emploihunt")),
                    IntroPageView(model: (img: AppAssets.image3,title: "Get your Best Joc Here",subtile: "Discover your ideal job here")),
                    IntroPageView(model: (img: AppAssets.image4,title: "Campus Placement",subtile: "Emploihunt can help you find your ideal job on campus")),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: size.height * 0.12,
            left: size.width * 0.43,
            child: const IntroNextButton(),)
        ],
      ),
    );
  }
}
