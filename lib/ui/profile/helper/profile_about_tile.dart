import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ProfileAboutTile extends ConsumerWidget {
  const ProfileAboutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return   Card(
      color: AppColors.colors.whiteColors,
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r)),
          title: Text(
            "About",
            style: TextStyles.w500.copyWith(
                fontSize: 16.sp,
                color: AppColors.colors.blackColors),
          ),
          subtitle: Text(
            "content goes here ",
            style: TextStyles.w500.copyWith(
                fontSize: 14.sp,
                color: AppColors.colors.greyRegent),
          ),
          trailing:  IconButton(onPressed: (){
            profileWatch.setDialogValue(3);
            profileWatch.updateIsDialogShow();
          },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),),
        ),
      ),
    );
  }
}
