import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class UserDetailsDialogBox extends ConsumerWidget {
  const UserDetailsDialogBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return SafeArea(
      child: Container(
        width: 340.w,
        height: 570.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom> 0? 230 : 0),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(4.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Change Info",style: TextStyles.w600.copyWith(fontSize: 22.sp,color: AppColors.colors.blueColors),).paddingVertical(10.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: CommonFormField(
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                          hintText: "First Name",labelText: "First Name",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),)),
                        SizedBox(width: 8.w,),
                        Expanded(child: CommonFormField(
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                          hintText: "Last Name",labelText: "Last Name",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CommonFormField(
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                          hintText: "Expertise",labelText: "Expertise",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),)),
                        SizedBox(width: 10.w,),
                        IconButton(
                          onPressed: (){}, icon: Icon(Icons.add,size: 30.sp,),style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: AppColors.colors.greyRegent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                            elevation: 1.5,
                            padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h)
                        ),)
                      ],
                    ).paddingOnly(top: 15.h,),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      width: double.infinity,
                      height: 140.h,
                      color: AppColors.colors.whiteCatskill,
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: List.generate(20, (index) => Container(
                            margin: EdgeInsets.all(10.sp),
                            padding: EdgeInsets.all(4.sp),
                            decoration: BoxDecoration(
                                color: AppColors.colors.whiteColors,
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(color: AppColors.colors.blueColors,width: 0.5.w)
                            ),
                            child: Text("Hello broiii",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                          )),
                        ),
                      ),
                    ),

                    CommonDropDownFormField(
                      items: SharedPrefServices.services.getList(locationKey)??["No Data"],
                      searchController: profileWatch.jobLocationSearchController,
                      onChanged: (value) {
                        profileWatch.updateSelectedJobLocation(value);
                      },
                      hintTextForDropdown: "Residential City",
                      hintTextForField: "Residential City",
                      selectedValue: profileWatch.selectedJobLocation,
                    ).paddingOnly(top: 10.h),
                    CommonFormField(
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: "Email",labelText: "Email",prefixIcon: Icon(Icons.mail,color: AppColors.colors.blueColors,),).paddingVertical(10.h),
                  ],
                ),
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

  width: size.width* 0.90.w,
      height: size.height * 0.70.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
          color: AppColors.colors.whiteColors,
          borderRadius: BorderRadius.circular(4.r)
      ),
 */