import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateDetailTile extends ConsumerWidget {
  const AppliedCandidateDetailTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Card(
      color: AppColors.colors.whiteColors,
      elevation: 4,
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Job Seeker",
                  style: TextStyles.w600.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.colors.blueDark),
                ),
                const Expanded(child: SizedBox())
              ],
            ),
            SizedBox(height: 70.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Parth Rathod",
                  style: TextStyles.w600.copyWith(
                      fontSize: 22.sp,
                      color: AppColors.colors.blueDark),
                ),
                Text(
                  "Ahmedabad",
                  style: TextStyles.w600.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.colors.blueColors),
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.home_work_outlined,size: 20.sp,color: AppColors.colors.blueColors,),
                Text(
                  "  Amri Systems",
                  style: TextStyles.w600.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.colors.blueDark),
                )
              ],
            ).paddingOnly(top: 10.h),
            Row(
              children: [
                Tooltip(
                  message:"1234567890",
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.colors.greyRegent.withOpacity(0.8),width: 0.5),
                      borderRadius: BorderRadius.circular(6.r)
                  ),
                  triggerMode: TooltipTriggerMode.tap,
                  enableFeedback: true,
                  textStyle: TextStyles.w600.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),
                  onTriggered: (){
                    /// call function
                  },
                  preferBelow: false,
                  child: Card(
                    elevation: 6,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.colors.whiteColors,
                      ),
                      child: Image.asset(AppAssets.phoneIcon,fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Tooltip(
                  message:"xyz@gmail.com",
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.colors.greyRegent.withOpacity(0.8),width: 0.5),
                      borderRadius: BorderRadius.circular(6.r)
                  ),
                  triggerMode: TooltipTriggerMode.tap,
                  enableFeedback: true,
                  textStyle: TextStyles.w600.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),
                  onTriggered: (){
                    /// call function
                  },
                  preferBelow: false,
                  child: Card(
                    elevation: 6,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.colors.whiteColors,
                      ),
                      child: Image.asset(AppAssets.emailIcon,fit: BoxFit.cover,),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
