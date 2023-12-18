import 'package:emploiflutter/frame_work/controller/applied_candidate_list_controller/applied_candidate_profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/applied_candidate_list_model/applied_user_model.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/applied_candidate_profile_details.dart';
import 'package:emploiflutter/ui/applied_candidate_profile/applied_candidate_profile_pic.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';


class AppliedCandidateProfile extends ConsumerStatefulWidget {
  final AppliedUserModel user;
  const AppliedCandidateProfile({super.key,required this.user});

  @override
  ConsumerState<AppliedCandidateProfile> createState() => _AppliedCandidateProfileState();
}

class _AppliedCandidateProfileState extends ConsumerState<AppliedCandidateProfile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(appliedCandidateProfileController).getExperienceByIdApi(widget.user.userJobPref!.id!.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Applied Candidate Profile",isLeadingShow: true,),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                 AppliedCandidateProfileDetails(userJobPref: widget.user.userJobPref!,),
                Positioned(
                  left: 120.w,
                    top: 70.h,
                    child:  AppliedCandidateProfilePic(userJobPref: widget.user.userJobPref!,))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
