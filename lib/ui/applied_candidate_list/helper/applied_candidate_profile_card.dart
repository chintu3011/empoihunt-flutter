import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateProfileCard extends StatelessWidget {
  const AppliedCandidateProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 170.h,
          width: 8.w,
          color: AppColors.colors.clayColors,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration:  BoxDecoration(
                color: AppColors.colors.whiteColors,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.black12,width: 0.5)
            ),
            height: 174.h,
            width: 112.w,
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                CircleAvatar(
                  radius: 43.r,
                  child: Image.asset(AppAssets.profilePicPng,fit: BoxFit.fill,),
                ),
                SizedBox(height: 15.h,),
                Text("Nand Vaghela",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.blueColors),softWrap: true,)
              ],
            ),
          ),
        )
      ],
    );

  }
}
