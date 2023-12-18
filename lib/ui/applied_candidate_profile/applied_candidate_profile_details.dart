import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/frame_work/repository/model/applied_candidate_list_model/applied_user_model.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_about_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_detail_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_experience_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_qualification_tile.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/helper/applied_candidate_resume_tile.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import 'helper/applied_candidate_job_preference_tile.dart';

class AppliedCandidateProfileDetails extends ConsumerWidget {
  final UserJobPrefModel userJobPref;
  const AppliedCandidateProfileDetails({super.key,required this.userJobPref});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: 120.h,
              width: double.infinity,
              child:
              CachedNetworkImage(imageUrl: "https://api.emploihunt.com${userJobPref.tProfileBannerUrl!}",
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(AppAssets.defaultBannerImage,fit: BoxFit.fitWidth,),fit: BoxFit.fitWidth,)

          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child:  Column(
              children: [

                /// Candidate Details ///
                AppliedCandidateDetailTile(userJobPref: userJobPref,),

                /// Candidate About Section ///
                AppliedCandidateAboutTile(userJobPref: userJobPref,),

                /// Candidate Qualification ///
                AppliedCandidateQualificationTile(userJobPref: userJobPref,),

                /// Candidate Experience ///
                const AppliedCandidateExperienceTile(),

                /// Job Preference ///
                const AppliedCandidateJobPreferenceTile(),

                /// Candidate Resume ////
                 const AppliedCandidateResumeTile()
              ],
            ),
          ),
        ],
      ),
    );
  }
}