import 'package:emploiflutter/frame_work/controller/dash_board_controller/dash_board_controller.dart';
import 'package:emploiflutter/frame_work/controller/setting_controller/setting_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';


class SettingBottomSheet extends ConsumerStatefulWidget{
  const SettingBottomSheet({super.key});

  @override
  ConsumerState<SettingBottomSheet> createState() => _SettingBottomSheetState();
}

class _SettingBottomSheetState extends ConsumerState<SettingBottomSheet> with SingleTickerProviderStateMixin {

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
    final settingWatch = ref.watch(settingController);
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
              CommonButton(btnText: "Yes", onPressed: ()async{
                ref.watch(dashBoardController).updateSelectedIndex(0);
                await settingWatch.singOutApi(context);
                SharedPrefServices.services.setBool(isUserLoggedIn, false);
                await BoxService.boxService.userGetDetailBox.clear();
                await BoxService.boxService.userModelBox.clear();
              },backgroundColor: AppColors.colors.blueColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h)),
              CommonButton(btnText: "No", onPressed: (){
                context.pop();
              },backgroundColor: AppColors.colors.whiteColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),side: BorderSide(color: AppColors.colors.blueColors)),textColor: AppColors.colors.blueColors,fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),onPrimary: Colors.grey,),
            ],
          )
        ],
      ),
    );
  }
}
