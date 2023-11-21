import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/register_profile_details2/register_profile_details2.0.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'register_profile_details1/register_profile_details1.dart';
import 'register_profile_details2/register_profile_details2.dart';
import 'register_profile_details3/register_profile_details3.dart';
import 'register_profile_details4/register_profile_details4.dart';

class RegisterProfileDetailsCardView extends ConsumerWidget {
  const RegisterProfileDetailsCardView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerProfileDetailWatch = ref.watch(registerProfileDetailsController);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      // margin: EdgeInsets.only(top: 100.h),
      elevation: 4,
      child: Container(
        width: width * 0.93,
        height: height * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: registerProfileDetailWatch.pageController,
              onPageChanged: (index){
                    registerProfileDetailWatch.index = index;
                    // print(registerProfileDetailWatch.index);
              },
              children: [
                const RegisterProfileDetails1(),
               registerProfileDetailWatch.isExperienced? const RegisterProfileDetails20(): const RegisterProfileDetails2(),
                const RegisterProfileDetails3(),
                const RegisterProfileDetails4(),
              ],
            )),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  registerProfileDetailWatch.index == 0 ?const SizedBox(): IconButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          backgroundColor: AppColors.colors.blueColors,
                          fixedSize: Size(60.w, 50.h)),
                      onPressed: () {
                        registerProfileDetailWatch.backwardBtn();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.colors.whiteColors,
                      )),
                  IconButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          backgroundColor: AppColors.colors.blueColors,
                          fixedSize: Size(60.w, 50.h)),
                      onPressed: () {
                        registerProfileDetailWatch.forwardBtn(context);
                      },
                      icon: Icon(Icons.arrow_forward_rounded,
                          color: AppColors.colors.whiteColors)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
