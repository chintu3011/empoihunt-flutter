import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_about_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_detail_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_experience_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_qualification_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_resume_tile.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateProfileDetails extends ConsumerWidget {
  const AppliedCandidateProfileDetails({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              profileWatch.setDialogValue(0);
              profileWatch.updateIsDialogShow();
            },
            child: SizedBox(
              height: 120.h,
              width: double.infinity,
              child: Image.asset(AppAssets.defaultBannerImage,fit: BoxFit.fitWidth,),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: const Column(
              children: [

                /// Candidate Details ///
                AppliedCandidateDetailTile(),

                /// Candidate About Section ///
                AppliedCandidateAboutTile(),

                /// Candidate Qualification ///
                AppliedCandidateQualificationTile(),

                /// Candidate Experience ///
                AppliedCandidateExperienceTile() ,

                /// Candidate Resume ////
                 AppliedCandidateResumeTile()
              ],
            ),
          ),
        ],
      ),
    );
  }
}