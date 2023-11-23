import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ProfileProfilePic extends ConsumerWidget {
  const ProfileProfilePic({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return Stack(
      children: [
        Container(
          height: 120.h,
          width: 140.w,
          padding: EdgeInsets.all(6.sp),
          clipBehavior: Clip.hardEdge,
          decoration:  BoxDecoration(
            color: AppColors.colors.whiteColors, 
            shape:BoxShape.circle
          ),
          child: Image.asset(AppAssets.profilePicPng,fit: BoxFit.contain,),
        ),
        Positioned(
          bottom: 0,
          right: 15,
          child: GestureDetector(
            onTap: (){
              profileWatch.setDialogValue(1);
              profileWatch.updateIsDialogShow();
            },
            child: Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 40.w,
              clipBehavior: Clip.hardEdge,
              decoration:  BoxDecoration(
                  color: AppColors.colors.clayColors,
                  border: Border.all(color: Colors.white,width: 4.w),
                  shape:BoxShape.circle
              ),
              child: Icon(Icons.add,color: AppColors.colors.whiteColors,)
            ),
          ),
        )
      ],
    );
  }
}
