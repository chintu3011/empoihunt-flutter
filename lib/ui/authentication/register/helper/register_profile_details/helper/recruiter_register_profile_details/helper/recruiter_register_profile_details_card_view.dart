import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/recruiter_register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import 'recruiter_register_profile_details1/recuiter_register_profile_details1.dart';
import 'recruiter_register_profile_details2/recruiter_register_profile_details2.dart';
import 'recruiter_register_profile_details3/recruiter_register_profile_details3.dart';


class RecruiterRegisterProfileDetailsCardView extends ConsumerWidget {
  const RecruiterRegisterProfileDetailsCardView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerProfileDetailWatch = ref.watch(recruiterRegisterProfileDetailsController);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: registerProfileDetailWatch.registerProfileDetailsGlobalKey,
      child: Card(
        // margin: EdgeInsets.only(top: 100.h),
        elevation: 4,
        child: Container(
          width: width * 0.93,
          height: 440.h,
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
                      registerProfileDetailWatch.pageIndex = index;
                      // print(registerProfileDetailWatch.index);
                },
                children: const [
                  RecruiterRegisterProfileDetails1(),
                  RecruiterRegisterProfileDetails2(),
                  RecruiterRegisterProfileDetails3(),

                ],
              )),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///---------------- Backward Button--------- ///
                    registerProfileDetailWatch.pageIndex == 0 ? const SizedBox():
                    IconButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
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

                    ///---------------- Forward Button --------------///
                    registerProfileDetailWatch.pageIndex == 2 && registerProfileDetailWatch.profilePic  != null?
                   IconButton(
                       style: ElevatedButton.styleFrom(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.r)),
                           backgroundColor: AppColors.colors.clayColors,
                           fixedSize: Size(60.w, 50.h)),
                       onPressed: () {
                         registerProfileDetailWatch.forwardBtn(context);
                       },
                       icon: Icon(Icons.check,
                           color: AppColors.colors.whiteColors)):
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
      ),
    );
  }
}
