import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_profile_image_viewer.dart';
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
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>CommonImageViewer(imageUrl: "https://api.emploihunt.com${userModel.tProfileUrl}")));
          },
          child: Container(
            height: 130.h,
            width: 150.w,
            padding: EdgeInsets.all(6.sp),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              height: 120.h,
              width: 140.w,
              clipBehavior: Clip.hardEdge,
              decoration:  BoxDecoration(
                color: AppColors.colors.whiteColors,
                shape:BoxShape.circle
              ),
              child:userModel.tProfileUrl !=""?
              Hero(
                tag: "profileHero",
                child: CachedNetworkImage(imageUrl: "https://api.emploihunt.com${userModel.tProfileUrl}",
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),fit: BoxFit.cover),
              )
                  : Image.asset(AppAssets.profilePicPng,fit: BoxFit.contain,),
            ),
          ),
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
