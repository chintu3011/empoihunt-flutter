import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/choose_user_role_controller/choose_user_role_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/profile/profile.dart';
import 'package:emploiflutter/ui/settings/helper/setting_bottom_sheet.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';
import '../../frame_work/controller/setting_controller/setting_controller.dart';
import '../../frame_work/controller/setting_controller/terms_privacy_policy_controller/terms_privacy_policy_controller.dart';
import '../utils/theme/text_styles.dart';

class Setting extends ConsumerStatefulWidget {
  const Setting({super.key});

  @override
  ConsumerState<Setting> createState() => _SettingState();
}

class _SettingState extends ConsumerState<Setting> {

  @override
  void initState() {
    print(BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user.vCurrentCompany);
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
       ref.read(termsPrivacyPolicyController).termsApiRequest();
       ref.read(termsPrivacyPolicyController).privacyPolicyApiRequest();
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingWatch = ref.watch(settingController);
    final userData = BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user;
    return  Scaffold(
      appBar: CommonAppBar(title: "Settings",actions: [ IconButton(onPressed: (){
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            context: context,
            builder: (context) => const SettingBottomSheet());
      }, icon: Icon(Icons.logout_outlined,color: AppColors.colors.blackColors,))
      ],),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          children: [
            ListTile(
              onTap: (){
                context.push(const Profile());
              },
              contentPadding: EdgeInsets.only(left: 0,top: 6.h,bottom: 6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: AppColors.colors.blueColors,width: 1.w)
              ),
              leading: CircleAvatar(
                radius: 34.r,
                child: Container(
                    height: 56.h,
                    width: 56.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: userData.tProfileUrl != null?
                    Image.network(
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return const Center(
                          child: Text('Error loading image'),
                        );
                      },
                      "https://api.emploihunt.com${userData.tProfileUrl}",fit: BoxFit.fill,):
                    Image.asset(AppAssets.profilePicPng,fit: BoxFit.fill,)
                ),
              ),
              title: Text(userData.vFirstName !=""? "${userData.vFirstName} ${userData.vLastName}":"",style: TextStyles.w600.copyWith(fontSize: 18.sp,color: AppColors.colors.blackColors),),
              subtitle: userData.vCurrentCompany !=null ? Text(userData.vCurrentCompany??"",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),):const SizedBox(),
            ),
            SizedBox(height: 25.h,),
            ...List.generate(
                userData.iRole == 0?
                settingWatch.seekerSettingList.length:
                  settingWatch.recruiterSettingList.length
                , (index) {
              final setting = userData.iRole ==0? settingWatch.seekerSettingList[index] : settingWatch.recruiterSettingList[index];
              return  Container(
                margin: EdgeInsets.only(bottom: 8.h),
                height: 45.h,
                child: ListTile(
                  onTap: (){
                    if(userData.iRole == 0){
                    settingWatch.seekerNavigatingToList(index, context);
                    }else{
                      settingWatch.recruiterNavigatingToList(index, context);
                    }
                  },
                  dense: true,
                  contentPadding: EdgeInsets.only(top:0,bottom: 0,right: 5.w,left: 3.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(color: AppColors.colors.blueColors,width: 1.w)
                  ),
                  leading: Icon(setting["Icon"],color: AppColors.colors.blueColors,),
                  title: Text(setting["Text"],style: TextStyles.w600.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.colors.clayColors,),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
