
import 'package:emploiflutter/frame_work/controller/campus_placement_controller/campus_placement_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/campus_placement_model/campus_placement_model.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CampusBottomSheet extends ConsumerStatefulWidget{
  final CampusPlacementModel model;
  const CampusBottomSheet({super.key, required this.model});

  @override
  ConsumerState<CampusBottomSheet> createState() => _SettingBottomSheetState();
}

class _SettingBottomSheetState extends ConsumerState<CampusBottomSheet> with SingleTickerProviderStateMixin {

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
    final campusPlacementWatch =ref.watch(campusPlacementController);
    return Container(
      height: 310,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Are you want to sure for apply ${widget.model.vCampusName} campus for placement",style: TextStyles.w400.copyWith(fontSize: 13.sp,color: AppColors.colors.blackColors),softWrap: true,),
          Align(
            alignment: Alignment.center,
              child: Lottie.asset(
                controller: alertController,
                AppAssets.exclamationMarkLottie,width: 180.w,
                height: 150.h,
                onLoaded: (_){
                  alertController.repeat();
                },
                fit: BoxFit.fill,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonButton(btnText: "Apply", onPressed: (){
                campusPlacementWatch.appliedApi(widget.model.id.toString(), context, );
              },backgroundColor: AppColors.colors.blueColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h)),
              CommonButton(btnText: "Cancel", onPressed: (){
                context.pop();
              },backgroundColor: AppColors.colors.blueColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),),fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),),
            ],
          )
        ],
      ),
    );
  }
}
