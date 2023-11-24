import 'package:emploiflutter/ui/applied_candidate_profile/applied_candidate_profile_details.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/applied_candidate_profile_pic.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';


class AppliedCandidateProfile extends ConsumerWidget {
  const AppliedCandidateProfile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Applied Candidate Profile",isLeadingShow: true,),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const AppliedCandidateProfileDetails(),
                Positioned(
                  left: 120.w,
                    top: 70.h,
                    child: const AppliedCandidateProfilePic())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
