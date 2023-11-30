import 'dart:io';

import 'package:emploiflutter/ui/contact_us/contact_us.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/theme/app_color.dart';

class SplashBlockedUserBottomSheet extends ConsumerStatefulWidget {
  const SplashBlockedUserBottomSheet({super.key});

  @override
  ConsumerState<SplashBlockedUserBottomSheet> createState() => _SplashBlockedUserBottomSheetState();
}

class _SplashBlockedUserBottomSheetState extends ConsumerState<SplashBlockedUserBottomSheet> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.white,
      enableDrag: false,
      onClosing: () {},
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          height: 300.h,
          width: context.screenWidth,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Your account has been blocked due to unauthenticated activities. Please contact to EmploiHunt app or call on +91 8469000537 ?",
                  style: TextStyles.w600.copyWith(
                      fontSize: 13.sp, color: AppColors.colors.blueColors),
                  softWrap: true,
                  textAlign: TextAlign.start),
              Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      controller: controller,
                      AppAssets.blockLottie,
                      onLoaded: (_){
                        controller.repeat();
                      },)),
              ),
              Row(
                children: [
                  Expanded(
                      child: CommonButton(
                        btnText: "Contact Us",
                        onPressed: () {
                          Navigator.push(context, PageTransition(child: const ContactUs(), type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 300)));
                        },
                        fontSize: 12.sp,
                        txtPadding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r)),
                        textColor: AppColors.colors.whiteColors,
                        backgroundColor: AppColors.colors.blueColors,
                      )),
                  SizedBox(width: 10.w,),
                  Expanded(
                      child:
                      CommonButton(
                        btnText: "ok",
                        onPressed: () {
                         exit(0);
                        },
                        onPrimary: AppColors.colors.blueColors,
                        fontSize: 14.sp,
                        txtPadding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r),
                            side: BorderSide(color: AppColors.colors.blueColors,width: 1.5)
                        ),
                        textColor: AppColors.colors.blueColors,
                        backgroundColor: AppColors.colors.whiteColors,
                      ))
                ],
              )

            ],
          ),
        );
      },
    );
  }
}
