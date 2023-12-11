import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ProfileProfilePic extends ConsumerWidget {
  final UserModel userModel;
  const ProfileProfilePic({super.key,required this.userModel});

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
          child:userModel.tProfileUrl !=""?
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
            "https://api.emploihunt.com${userModel.tProfileUrl}",fit: BoxFit.fill,)
              : Image.asset(AppAssets.profilePicPng,fit: BoxFit.contain,),
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
