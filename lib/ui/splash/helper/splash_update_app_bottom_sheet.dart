

import 'package:emploiflutter/frame_work/controller/splash_controller/splash_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/theme/app_assets.dart';
import '../../utils/theme/app_color.dart';

class SplashUpdateAppBottomSheet extends ConsumerStatefulWidget {
  final String? updateMsg;
  const SplashUpdateAppBottomSheet(this.updateMsg,  {super.key});

  @override
  ConsumerState<SplashUpdateAppBottomSheet> createState() => _SplashUpdateAppBottomSheetState();
}

class _SplashUpdateAppBottomSheetState extends ConsumerState<SplashUpdateAppBottomSheet> with SingleTickerProviderStateMixin{


  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final splashWatch = ref.watch(splashController);
    return BottomSheet(
      backgroundColor: Colors.white,
      enableDrag: false,
      onClosing: () {},
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          height: 330.h,
          width: context.screenWidth,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10.h,),
              Text(
                  "A new version of the app is available.Update EmploiHunt App.\n${widget.updateMsg}",
                  style: TextStyles.w600.copyWith(
                      fontSize: 13.sp, color: AppColors.colors.blueColors),
                  softWrap: true,
                  textAlign: TextAlign.start),
              Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      controller: controller,
                      AppAssets.updateLottie,
                      onLoaded: (_){
                        controller.repeat();
                      },)),
              ),
              Row(
                children: [
                  Expanded(
                      child: CommonButton(
                        btnText: "Update",
                        onPressed: () {
                          launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.amri.emploihunt"));
                        },
                        fontSize: 12.sp,
                        txtPadding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 30.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r)),
                        textColor: AppColors.colors.whiteColors,
                        backgroundColor: AppColors.colors.blueColors,
                      )),
                  SizedBox(width: 10.w,),
                  Expanded(
                      child:
                      CommonButton(
                        btnText: "No",
                        onPressed: () {
                          context.pop();
                          splashWatch.userAuthenticatedOrNot(context);
                        },
                        fontSize: 14.sp,
                        onPrimary: AppColors.colors.blueColors,
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
