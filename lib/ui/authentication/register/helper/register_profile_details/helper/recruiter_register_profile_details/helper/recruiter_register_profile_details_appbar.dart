import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/recruiter_register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class RecruiterRegisterProfileDetailsAppBar extends ConsumerWidget implements PreferredSizeWidget{
  const RecruiterRegisterProfileDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerProfileDetailWatch = ref.watch(recruiterRegisterProfileDetailsController);
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.colors.clayColors,
        elevation: 0.0,
          title: Row(
            children: List.generate(4, (index) {
              if(registerProfileDetailWatch.pageIndex >= index){
                return Container(
                  height: 40.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colors.blueColors
                  ),
                  child: const Icon(Icons.check,color: Colors.white,),
                );
              }
              if(registerProfileDetailWatch.pageIndex == index -1){
                return Container(
                  height: 40.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colors.blueColors
                  ),
                  // child: const Icon(Icons.check,color: Colors.white,),
                );
              }
                  return Container(
                    height: 40.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colors.blueColors.withOpacity(0.5)
                    ),
                    // child: const Icon(Icons.check,color: Colors.white,),
                  );
             }
            ),
          ),
        // actions: [
        //   TextButton(onPressed: (){}, child: Text("Skip",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.whiteColors),))
        // ],
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
