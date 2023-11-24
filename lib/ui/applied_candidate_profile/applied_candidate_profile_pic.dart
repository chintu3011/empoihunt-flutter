import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateProfilePic extends ConsumerWidget {
  const AppliedCandidateProfilePic({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      height: 120.h,
      width: 140.w,
      padding: EdgeInsets.all(6.sp),
      clipBehavior: Clip.hardEdge,
      decoration:  BoxDecoration(
        color: AppColors.colors.whiteColors,
        shape:BoxShape.circle
      ),
      child: Image.asset(AppAssets.profilePicPng,fit: BoxFit.contain,),
    );
  }
}
