import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import '../../frame_work/repository/model/applied_candidate_list_model/applied_user_model.dart';

class AppliedCandidateProfilePic extends ConsumerWidget {
  final UserJobPrefModel userJobPref;
  const AppliedCandidateProfilePic({super.key,required this.userJobPref});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      height: 130.h,
      width: 150.w,
      padding: EdgeInsets.all(6.sp),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Container(
        height: 120.h,
        width: 140.w,
        clipBehavior: Clip.hardEdge,
        decoration:  BoxDecoration(
            color: AppColors.colors.whiteColors,
            shape:BoxShape.circle
        ),
        child:userJobPref.tProfileUrl !=""?
        Hero(
          tag: "profileHero",
          child: CachedNetworkImage(imageUrl: "https://api.emploihunt.com${userJobPref.tProfileUrl}",
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),fit: BoxFit.fill),
        )
            : Image.asset(AppAssets.profilePicPng,fit: BoxFit.contain,),
      ),
    );
  }
}
