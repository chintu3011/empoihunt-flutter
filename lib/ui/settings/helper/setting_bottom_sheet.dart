
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class SettingBottomSheet extends StatefulWidget{
  const SettingBottomSheet({super.key});

  @override
  State<SettingBottomSheet> createState() => _SettingBottomSheetState();
}

class _SettingBottomSheetState extends State<SettingBottomSheet> with SingleTickerProviderStateMixin {

  late AnimationController logoutController;

  @override
  void initState() {
    super.initState();
    logoutController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    // logoutController.repeat();
  }
  @override
  void deactivate() {
    super.deactivate();
    logoutController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Are you sure you want to log out?",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
          Align(
            alignment: Alignment.center,
              child: Lottie.asset(
                controller: logoutController,
                AppAssets.logOutLottie,width: 180.w,
                height: 180.h,
                onLoaded: (_){
                  logoutController.repeat();
                },
                fit: BoxFit.fill,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonButton(btnText: "Yes", onPressed: (){},backgroundColor: AppColors.colors.blueColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h)),
              CommonButton(btnText: "No", onPressed: (){},backgroundColor: AppColors.colors.whiteColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),side: BorderSide(color: AppColors.colors.blueColors)),textColor: AppColors.colors.blueColors,fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),onPrimary: Colors.grey,),
            ],
          )
        ],
      ),
    );
  }
}
