
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CampusBottomSheet extends StatefulWidget{
  final String companyName;
  const CampusBottomSheet({super.key, required this.companyName});

  @override
  State<CampusBottomSheet> createState() => _SettingBottomSheetState();
}

class _SettingBottomSheetState extends State<CampusBottomSheet> with SingleTickerProviderStateMixin {

  late AnimationController alertController;

  @override
  void initState() {
    super.initState();
    alertController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
  }
  @override
  void deactivate() {
    super.deactivate();
    alertController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Are you want to sure for apply ${widget.companyName} campus for placement",style: TextStyles.w400.copyWith(fontSize: 13.sp,color: AppColors.colors.blackColors),softWrap: true,),
          Align(
            alignment: Alignment.center,
              child: Lottie.asset(
                controller: alertController,
                AppAssets.execlaminationMarkLottie,width: 180.w,
                height: 150.h,
                onLoaded: (_){
                  alertController.repeat();
                },
                fit: BoxFit.fill,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonButton(btnText: "Apply", onPressed: (){},backgroundColor: AppColors.colors.blueColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h)),
              CommonButton(btnText: "Cancel", onPressed: (){},backgroundColor: AppColors.colors.blueColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),),fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),),
            ],
          )
        ],
      ),
    );
  }
}
