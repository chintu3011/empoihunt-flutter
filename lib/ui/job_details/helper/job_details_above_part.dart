import 'package:emploiflutter/frame_work/controller/job_details_controller/job_details_controller.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/theme/text_styles.dart';
import '../../utils/theme/theme.dart';

class JobDetailsAbovePart extends ConsumerWidget {
  const JobDetailsAbovePart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final jobDetailsWatch = ref.watch(jobDetailsController);
    return Column(
      children: [
        Card(
          elevation: 4,
          child: Container(
            width: double.infinity,
            color: AppColors.colors.whiteColors,
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                jobDetailsWatch.offset <= 0? Text("Android Developer",style: TextStyles.w500.copyWith(fontSize: 27.sp,color: AppColors.colors.blueColors),).paddingOnly(bottom: 5.h):const SizedBox(),
                Row(
                  children: [
                    SizedBox(height: 35.h,width: 70.w,child: Image.asset(AppAssets.appLogo,fit: BoxFit.fill,),),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("LogicFlash Solutions",style: TextStyles.w500.copyWith(fontSize: 21.sp,color: AppColors.colors.blackColors),),
                          Text("Ahmedabad",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),)
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("21 hours ago •",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors),),
                    Text(" 2 Applications",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
                  ],
                ).paddingVertical(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.workingModeSvg,color: AppColors.colors.blueColors),
                          // Icon(Icons.shopping_bag_outlined,color: AppColors.colors.blueColors,size: 20.sp,),
                          Text("On-Site",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blackColors),)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text("Salary - 2 Lakh LPA",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blackColors),softWrap: true,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Container(
            width: double.infinity,
            color: AppColors.colors.whiteColors,
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.bioGraphSvg,color: AppColors.colors.blueColors),
                    // Icon(Icons.file_copy_rounded,color: AppColors.colors.blueColors,size: 20,),
                    SizedBox(width: 5.w,),
                    Text("Job Description",style: TextStyles.w500.copyWith(fontSize: 18.sp,color: AppColors.colors.blackColors))
                  ],
                ),
               SizedBox(
                 width: 150.w,
                   child: Text("qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjk",softWrap: true,style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.greyRegent)))
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Container(
            width: double.infinity,
            color: AppColors.colors.whiteColors,
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.bioGraphSvg,color: AppColors.colors.blueColors,),
                    // Icon(Icons.file_copy_rounded,color: AppColors.colors.blueColors,size: 20.sp,),
                    SizedBox(width: 5.w,),
                    Text("Role & Responsibility",style: TextStyles.w500.copyWith(fontSize: 18.sp,color: AppColors.colors.blackColors))
                  ],
                ),
                SizedBox(
                    width: 150.w,
                    child: Text("make UI with responsive",softWrap: true,style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.greyRegent)))
              ],
            ),
          ),
        )


      ],
    );
  }
}
