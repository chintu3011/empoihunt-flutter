import 'package:emploiflutter/frame_work/controller/setting/setting_controller.dart';
import 'package:emploiflutter/ui/settings/helper/setting_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class Setting extends ConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final settingWatch = ref.watch(settingController);
    return  Scaffold(
      appBar: const SettingAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 0,top: 6.h,bottom: 6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: AppColors.colors.blueColors,width: 1.w)
              ),
              leading: CircleAvatar(
                radius: 34.r,
                foregroundImage: const AssetImage(AppAssets.profilePicPng),
              ),
              title: Text("Parth Rathod",style: TextStyles.w500.copyWith(fontSize: 18.sp,color: AppColors.colors.blackColors),),
            ),


            SizedBox(height: 25.h,),
            ...List.generate(settingWatch.settingList.length, (index) {
              final setting = settingWatch.settingList[index];
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
                  title: Text(setting["Text"],style: TextStyles.w300.copyWith(fontSize: 10.sp,color: AppColors.colors.blackColors),),
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
