

import '../../utils/theme/app_color.dart';
import '../../utils/theme/theme.dart';
import '../controller/on_boarding_controller.dart';

class IntroAppbar extends ConsumerWidget implements PreferredSizeWidget{
  const IntroAppbar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final introViewWatch = ref.watch(onBoardingController);
    return  PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
    child:AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.18,
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(4, (index) {
              if (introViewWatch.index == index) {
                return Container(
                  height: 8.h,
                  width: 30.w,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.colors.clayColors,
                  ),
                );
              } else {
                return Padding(
                  padding:  EdgeInsets.only(left: 3.w),
                  child: Container(
                    height: 8.h,
                    width: 8.w,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.colors.blueColors,
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: (){}, child: Text("Skip",style: TextStyle(fontSize: 16.sp,color: AppColors.colors.blueColors,fontWeight: FontWeight.w400),))
      ],
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

}
