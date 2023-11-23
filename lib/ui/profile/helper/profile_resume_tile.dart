import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ProfileResumeTile extends ConsumerWidget {
  const ProfileResumeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
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
                  "content goes here ",
                  style: TextStyles.w500.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.colors.greyRegent),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Icon(
                  Icons.get_app_sharp,
                  color: AppColors.colors.blackColors,
                )
              ],
            ),
          ),
          trailing: IconButton(onPressed: (){
            profileWatch.setDialogValue(6);
            profileWatch.updateIsDialogShow();
          },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),),
        ),
      ),
    );
  }
}
