import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../utils/theme/text_styles.dart';

class ProfileUserDetails extends ConsumerWidget {
  const ProfileUserDetails({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 120.h,
            width: double.infinity,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [

                /// User Details///
                Card(
                  color: AppColors.colors.whiteColors,
                  elevation: 4,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: AppColors.colors.whiteColors,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Job Seeker",
                              style: TextStyles.w600.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.colors.blueDark),
                            ),
                            IconButton(onPressed: (){
                              profileWatch.setDialogValue(0);
                              profileWatch.updateIsDialogShow();
                              // showDialog(context: context, builder: (context)=>const UserDetailsDialogBox());
                              // showGeneralDialog(
                              //     barrierDismissible: true,
                              //     barrierLabel: "",
                              //     context: context, pageBuilder: (context, animation, secondaryAnimation){
                              //       return const UserDetailsDialogBox();
                              // });
                            }, icon: Icon(
                              Icons.edit,
                              color: AppColors.colors.blueColors,
                              size: 18,
                            ))
                          ],
                        ),
                        SizedBox(height: 70.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Parth Rathod",
                              style: TextStyles.w600.copyWith(
                                  fontSize: 22.sp,
                                  color: AppColors.colors.blueDark),
                            ),
                            Text(
                              "Ahmedabad",
                              style: TextStyles.w600.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.colors.blueColors),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.home_work_outlined,size: 20.sp,color: AppColors.colors.blueColors,),
                            Text(
                              "  Amri Systems",
                              style: TextStyles.w600.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.colors.blueDark),
                            )
                          ],
                        ).paddingOnly(top: 10.h),
                        Row(
                          children: [
                            Tooltip(
                              message:"1234567890",
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.colors.greyRegent.withOpacity(0.8),width: 0.5),
                                borderRadius: BorderRadius.circular(6.r)
                              ),
                              triggerMode: TooltipTriggerMode.tap,
                              enableFeedback: true,
                              textStyle: TextStyles.w600.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),
                              onTriggered: (){
                                /// call function
                              },
                              preferBelow: false,
                              child: Card(
                                elevation: 6,
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: AppColors.colors.whiteColors,
                                  ),
                                  child: Image.asset(AppAssets.phoneIcon,fit: BoxFit.cover,),
                                ),
                              ),
                            ),
                            Tooltip(
                              message:"xyz@gmail.com",
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.colors.greyRegent.withOpacity(0.8),width: 0.5),
                                  borderRadius: BorderRadius.circular(6.r)
                              ),
                              triggerMode: TooltipTriggerMode.tap,
                              enableFeedback: true,
                              textStyle: TextStyles.w600.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),
                              onTriggered: (){
                                /// call function
                              },
                              preferBelow: false,
                              child: Card(
                                elevation: 6,
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: AppColors.colors.whiteColors,
                                  ),
                                  child: Image.asset(AppAssets.emailIcon,fit: BoxFit.cover,),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                /// User About Section ///
                Card(
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
                        profileWatch.setDialogValue(1);
                        profileWatch.updateIsDialogShow();
                      },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),),
                    ),
                  ),
                ),

                ///User Qualification ///
                Card(
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
                              "Qualification",
                              style: TextStyles.w500.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.colors.blackColors),
                            ),
                            IconButton(onPressed: (){
                              profileWatch.setDialogValue(2);
                              profileWatch.updateIsDialogShow();
                            },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),)                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "content Goes here",
                          style: TextStyles.w500.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.colors.greyRegent),
                        )
                      ],
                    ),
                  ),
                ),

                ///User Experience ///
                Card(
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
                              "Experience",
                              style: TextStyles.w500.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.colors.blackColors),
                            ),
                            IconButton(onPressed: (){
                              profileWatch.setDialogValue(3);
                              profileWatch.updateIsDialogShow();
                            },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),)                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            const Spacer(),
                            Image.asset(AppAssets.experienceEmptyIcon,scale: 14,),
                            const Spacer(),
                          ],
                        ),
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
                              Text("CTO (Chief Techonologieskjfhjha)",overflow:TextOverflow.ellipsis,style: TextStyles.w500.copyWith(fontSize: 20.sp,color: AppColors.colors.blueDark),),
                              Text("6xxu",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ahmedabad",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
                                  Text("Present",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.clayColors),)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                /// User Resume ////
                Card(
                  color: AppColors.colors.whiteColors,
                  elevation: 6,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.colors.whiteColors,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      title: Text(
                        "Resume",
                        style: TextStyles.w500.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.colors.blackColors),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          children: [
                            Text(
                              "content goes here ",
                              style: TextStyles.w500.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.colors.greyRegent),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.get_app_sharp,
                              color: AppColors.colors.blackColors,
                            )
                          ],
                        ),
                      ),
                      trailing: IconButton(onPressed: (){
                        profileWatch.setDialogValue(4);
                        profileWatch.updateIsDialogShow();
                      },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}