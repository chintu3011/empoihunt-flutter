import 'package:emploiflutter/frame_work/controller/home_controller/job_seeker_home_controller/job_seeker_home_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';

class AdsDialogCampus extends ConsumerWidget {
  const AdsDialogCampus({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final jobSeekerHomeWatch = ref.watch(jobSeekerHomeController);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(18 .sp),
          height: 450.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.colors.clayColors,
                    AppColors.colors.whiteColors,
                    AppColors.colors.clayColors,
                    AppColors.colors.whiteColors,
                    AppColors.colors.clayColors,
                  ],
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.campusAddedLottie,repeat: true,height: 200.h,width: 320.w),
              Text("Hurrayy!! New Campus Added",style: TextStyles.w600.copyWith(fontSize: 14.sp, color: AppColors.colors.blueDark)),
              Text("Apply now",style: TextStyles.w500.copyWith(fontSize: 16.sp, color: AppColors.colors.blueDark)),
            ],
          ),
        ),
        Positioned(
            left: 3,
            top: 3,
            child: IconButton(onPressed: ()async{
              Navigator.pop(context);
              await jobSeekerHomeWatch.campusMessageReadApi();
            }, icon: Icon(Icons.cancel,size: 30.sp,color: AppColors.colors.blueDark,)))
      ],
    );
  }
}
