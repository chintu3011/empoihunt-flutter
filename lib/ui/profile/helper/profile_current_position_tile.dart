import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ProfileCurrentPositionTile extends ConsumerWidget {
  final UserModel user;
  const ProfileCurrentPositionTile({super.key,required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Current Position",
                  style: TextStyles.w500.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.colors.blackColors),
                ),
                IconButton(onPressed: (){
                  profileWatch.setDialogValue(5);
                  profileWatch.addCurrentPositionToDialog(user);
                  profileWatch.updateIsDialogShow();
                },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),)                          ],
            ),
            SizedBox(height: 10.h,),
            user.vCurrentCompany != ""?
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              width: size.width * 0.90 ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: AppColors.colors.blueDark,width: 1.5.w),
                  color: AppColors.colors.whiteColors
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.vDesignation??"",overflow:TextOverflow.ellipsis,style: TextStyles.w500.copyWith(fontSize: 22.sp,color: AppColors.colors.blueColors),),
                  Text(user.vCurrentCompany ??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(user.vJobLocation??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
                      Text(user.vWorkingMode ??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.clayColors),)
                    ],
                  )
                ],
              ),
            ):
            Row(
              children: [
                const Spacer(),
                Image.asset(AppAssets.experienceEmptyIcon,scale: 14,),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
