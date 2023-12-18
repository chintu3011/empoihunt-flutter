import 'package:emploiflutter/frame_work/repository/model/applied_candidate_list_model/applied_user_model.dart';
import 'package:emploiflutter/ui/applied_candidate_list/helper/applied_candidate_profile_card.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../applied_candidate_profile/applied_candidate_profile.dart';

class AppliedCandidateListTile extends StatelessWidget {
  final AppliedUserModel user;
  const AppliedCandidateListTile({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 18.h),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.colors.blueColors,width: 1.5),
            ),
            child:  InkWell(
              onTap: (){
                Navigator.push(context, PageTransition(child: AppliedCandidateProfile(user: user,), type: PageTransitionType.rightToLeft,childCurrent: this));
              },
              child: Row(
                children: [
                  SizedBox(width: 115.w,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.userJobPref!.vPreferJobTitle??"",style: TextStyles.w500.copyWith(fontSize: 15.sp,color: AppColors.colors.blueColors),),
                      SizedBox(height: 10.h,),
                      Text(user.userJobPref!.vQualification??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 15.h,),
                      Text(user.userJobPref!.vCurrentCompany!=null  && user.userJobPref!.vCurrentCompany != ""? "Experience":"Fresher",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: AppColors.colors.blueDark
                            ),
                            child: Text(user.userJobPref!.vCity!,style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                          ),
                          SizedBox(width: 8.w,),
                          user.userJobPref!.vWorkingMode != null?Container(
                            padding: EdgeInsets.all(3.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: AppColors.colors.clayColors
                            ),
                            child: Text(user.userJobPref!.vWorkingMode??"",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                          ):const SizedBox()
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 17.h,horizontal: 10.w))
                ],
              ),
            ),
          ),
          AppliedCandidateProfileCard( userJobPref: user.userJobPref!,),
          ///------------------ Call and mail share Icons ----------///
          Positioned(
            bottom: 1,
            right: 10.w,
            child: Row(
              children: [
                Tooltip(
                  message:user.userJobPref!.vMobile,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.colors.greyRegent.withOpacity(0.8),width: 0.5),
                      borderRadius: BorderRadius.circular(6.r)
                  ),
                  triggerMode: TooltipTriggerMode.tap,
                  enableFeedback: true,
                  textStyle: TextStyles.w600.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),
                  onTriggered: (){
                    Future.delayed(const Duration(milliseconds: 700),()async{
                      await launchUrl(Uri(
                          scheme: 'tel',
                          path: user.userJobPref!.vMobile
                      ));
                    });
                  },
                  preferBelow: false,
                  child: Card(
                    elevation: 6,
                    child: Container(
                      height: 26.h,
                      width: 26.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colors.whiteColors,
                      ),
                      child: Icon(Icons.call,size: 15.sp,),
                    ),
                  ),
                ),
                SizedBox(width: 5.w,),
                Tooltip(
                  message:user.userJobPref!.vEmail,
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
                      height: 26.h,
                      width: 26.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colors.whiteColors,
                      ),
                      child: Icon(Icons.mail,size: 15.sp,),
                    ),
                  ),
                )
                ,
              ],
            ),
          )
        ],
      ),
    );
  }
}
