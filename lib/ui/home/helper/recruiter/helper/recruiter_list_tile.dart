import 'package:emploiflutter/ui/home/helper/recruiter/helper/recruiter_profile_card.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_with_device_token_model.dart';


class RecruiterListTile extends StatelessWidget {
  final UserWithDeviceTokenModel user;
  const RecruiterListTile({super.key,required this.user});

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
            child:  Row(
              children: [
                 SizedBox(width: 115.w,),
                 Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.vPreferJobTitle??"",style: TextStyles.w500.copyWith(fontSize: 15.sp,color: AppColors.colors.blueColors),overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 10.h,),
                    Text(user.vQualification??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),overflow: TextOverflow.ellipsis,),
                    Text(user.vCurrentCompany!=null  && user.vCurrentCompany != ""? "Experience":"Fresher",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                    Text(" ${user.tTagLine??""}"),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        user.vPreferCity != null?
                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.colors.blueDark
                          ),
                          child: Text(user.vPreferCity??"",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                        ):
                        const SizedBox(),

                        SizedBox(width: 8.w,),
                        user.vWorkingMode != null?
                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.colors.clayColors
                          ),
                          child: Text(user.vWorkingMode??"",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                        ):const SizedBox()
                      ],
                    )
                  ],
                ).paddingSymmetric(vertical: 17.h,horizontal: 10.w))
              ],
            ),
          ),
          RecruiterProfileCard(user:user),
          ///------------------ Call and mail share Icons ----------///
          Positioned(
            bottom: 1,
            right: 10.w,
            child: Row(
              children: [
                Tooltip(
                  message:user.vMobile,
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
                          path: user.vMobile
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
                  message:user.vEmail,
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
                      launchUrl(Uri(
                      scheme: 'mailto',
                      path: user.vEmail,
                    ));});
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
