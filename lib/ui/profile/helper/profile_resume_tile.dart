import 'package:emploihunt/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploihunt/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploihunt/ui/profile/profile_pdf_viewer.dart';
import 'package:emploihunt/ui/utils/common_service/helper.dart';
import 'package:emploihunt/ui/utils/theme/app_color.dart';
import 'package:emploihunt/ui/utils/theme/text_styles.dart';
import 'package:emploihunt/ui/utils/theme/theme.dart';

import '../../utils/common_widget/common_video_player.dart';

class ProfileResumeTile extends ConsumerWidget {
  final UserModel user;
  const ProfileResumeTile({super.key,required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    // String resumeName = "";
    // final url = user.tResumeUrl!.split("/");
    // resumeName = url[4];
    return  Column(
      children: [
        Card(
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
                      user.tResumeUrl !=""? "${user.vFirstName}'s Resume" :"",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.w500.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.colors.greyRegent),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  IconButton(onPressed: (){
                    print(user.tResumeUrl);
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> ProfilePDFViewer(user: user,)));
                    }, icon: Icon(
                    Icons.get_app_sharp,
                    color: AppColors.colors.blackColors,
                  )
                  )
                  ],
                ),
              ),
              trailing: IconButton(onPressed: (){
                profileWatch.setDialogValue(6);
                profileWatch.addResumeNameToDialog("${user.vFirstName}'s Resume");
                profileWatch.updateIsDialogShow();
              },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),),
            ),
          ),
        ),
        Card(
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
                "Video Resume",
                style: TextStyles.w500.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.colors.blackColors),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    Text(
                      user.tVideoResumeUrl !=null || user.tVideoResumeUrl != ""? "${user.vFirstName}'s Video Resume" :"",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.w500.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.colors.greyRegent),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  IconButton(onPressed: (){
                    kPrint(user.tVideoResumeUrl);
                    if(user.tVideoResumeUrl != null){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> PlayVideoScreen(path: user.tVideoResumeUrl!,)));
                    }
                    }, icon: Icon(
                    Icons.play_arrow,
                    color: AppColors.colors.blackColors,
                  ))
                  ],
                ),
              ),
              trailing: IconButton(onPressed: (){
                profileWatch.setDialogValue(7);
                profileWatch.addResumeNameToDialog("${user.vFirstName}'s Resume");
                profileWatch.updateIsDialogShow();
              },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors)),
            ),
          ),
        ),
      ],
    );
  }
}
