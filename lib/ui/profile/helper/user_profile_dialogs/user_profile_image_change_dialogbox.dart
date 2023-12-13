import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:lottie/lottie.dart';

class UserProfileImageChangeDialogBox extends ConsumerStatefulWidget {
  final UserModel userModel;
  const UserProfileImageChangeDialogBox({required this.userModel,super.key});

  @override
  ConsumerState<UserProfileImageChangeDialogBox> createState() => _UserBannerImageDialogBoxState();
}

class _UserBannerImageDialogBoxState extends ConsumerState<UserProfileImageChangeDialogBox>  with SingleTickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    ref.read(profileController).uploadProfileImgLottieController = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    ref.read(profileController).uploadProfileImgLottieController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context,) {
    final profileWatch = ref.watch(profileController);
    return SafeArea(
      child: Container(
        width: 340.w,
        height: 500.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom> 0? 230 : 0),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(4.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Change Image",style: TextStyles.w500.copyWith(fontSize: 22.sp,color: AppColors.colors.blueColors),).paddingVertical(10.h),
            Expanded(
              child: Column(
                children: [

                  ///------------- Profile Image Lottie here --------------///
                  Container(
                    height: 280.h,
                    width:  double.infinity.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child:
                    profileWatch.isProfileImgAnimationRun?
                     Center(child: Lottie.asset(AppAssets.imgLoadingLottie,),) :
                    profileWatch.profileImg != null? Image.file(profileWatch.profileImg!,fit: BoxFit.fill,): widget.userModel.tProfileUrl !=""?
                        CachedNetworkImage(imageUrl: "https://api.emploihunt.com${widget.userModel.tProfileUrl}",
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),fit: BoxFit.fill)
                        : Image.asset(AppAssets.profilePicPng,fit: BoxFit.contain,),
                  ),
                  const Spacer(),
                  ///---------- Image Picker Icon --------///
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: AppColors.colors.clayColors,width: 5.w)
                    ),
                    child: IconButton(onPressed: (){
                              profileWatch.pickProfileImg();
                    },icon: Image.asset(AppAssets.uploadImgIcon,height: 50.h,),),
                  )
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(onPressed: (){
                  profileWatch.updateIsDialogShow();
                }, child: Text("CANCEL",style: TextStyles.w500.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors),)),
                SizedBox(width: 10.w,),
                TextButton(onPressed: (){
                  profileWatch.updateIsDialogShow();
                  profileWatch.profileImgName!=""? profileWatch.profileImgApiCall(profileWatch.profileImgName,profileWatch.profileImgUrl!):null;
                }, child: Text("Done",style: TextStyles.w500.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors),)),
              ],
            ).paddingOnly(top: 10.h,)
          ],
        ),
      ),
    );
  }
}


/*
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
                          child: Text('No Image Provided'),
                        );
                      },
                      "https://api.emploihunt.com${widget.userModel.tProfileUrl}",fit: BoxFit.fill,)

 */