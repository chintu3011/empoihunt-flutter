import 'package:emploiflutter/ui/profile/profile.dart';
import 'package:emploiflutter/ui/settings/helper/setting_bottom_sheet.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
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
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const Profile()));
              },
              contentPadding: EdgeInsets.only(left: 0,top: 6.h,bottom: 6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: AppColors.colors.blueColors,width: 1.w)
              ),
              leading: CircleAvatar(
                radius: 34.r,
                foregroundImage: const AssetImage(AppAssets.profilePicPng),
              ),
              title: Text("Parth Rathod",style: TextStyles.w600.copyWith(fontSize: 18.sp,color: AppColors.colors.blackColors),),
              subtitle: Text("Amri Systen",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
            ),
            SizedBox(height: 25.h,),
            ...List.generate(settingWatch.seekerSettingList.length, (index) {
              final setting = settingWatch.seekerSettingList[index];
              return  Container(
                margin: EdgeInsets.only(bottom: 8.h),
                height: 45.h,
                child: ListTile(
                  onTap: (){
                    settingWatch.navigatingToList(index, context);
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
,
          ],
        ),
      ),
    );
  }
}
