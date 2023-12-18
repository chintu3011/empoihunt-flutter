import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:page_transition/page_transition.dart';

import '../../../frame_work/repository/model/applied_candidate_list_model/applied_user_model.dart';
import '../applied_candidate_resume_viewer.dart';

class AppliedCandidateResumeTile extends ConsumerWidget {
  final UserJobPrefModel userJobPref;
  const AppliedCandidateResumeTile({super.key,required this.userJobPref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Card(
      color: AppColors.colors.whiteColors,
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r)),
          title: Text(
            "Resume",
            style: TextStyles.w500.copyWith(
                fontSize: 18.sp,
                color: AppColors.colors.blackColors),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              children: [
                Text(
                  "${userJobPref.vFirstName}'s Resume",
                  style: TextStyles.w500.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.colors.greyRegent),
                ),
                SizedBox(
                  width: 5.w,
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, PageTransition(child: AppliedCandidateResumeViewer(pdfUrl: userJobPref.tResumeUrl!,), type: PageTransitionType.leftToRight,childCurrent: this));
                }, icon:Icon(
                  Icons.get_app_sharp,
                  color: AppColors.colors.blackColors,
                )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
