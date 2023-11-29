import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateExperienceTile extends ConsumerWidget {
  const AppliedCandidateExperienceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Experience",
              style: TextStyles.w500.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.colors.blackColors),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                const Spacer(),
                Image.asset(AppAssets.experienceEmptyIcon,scale: 14,),
                const Spacer(),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              width: size.width * 0.90 ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: AppColors.colors.blueDark,width: 1.5.w),
                  color: AppColors.colors.whiteColors
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CTO (Chief Techonologieskjfhjha)",overflow:TextOverflow.ellipsis,style: TextStyles.w500.copyWith(fontSize: 20.sp,color: AppColors.colors.blueDark),),
                  Text("6xxu",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ahmedabad",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
                      Text("Present",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.clayColors),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}