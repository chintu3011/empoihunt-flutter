import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class UpdatePostSkillsWidget extends StatelessWidget {
  const UpdatePostSkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Technical Skills ///
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          width: double.infinity,
          height: 150.h,
          color: AppColors.colors.whiteCatskill,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 6.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: CommonFormField(
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: "Developer",labelText: "Required Technical Skills",prefixIcon: Icon(Icons.stacked_bar_chart_rounded,color: AppColors.colors.blueColors,),)),
                    SizedBox(width: 10.w,),
                    IconButton(
                      onPressed: (){}, icon: Icon(Icons.add,size: 20.sp,),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: AppColors.colors.greyRegent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        elevation: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h)
                    ),)
                  ],
                ),
                Wrap(
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
              ],
            ),
          ),
        ),


        /// Soft Skills ///
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          width: double.infinity,
          height: 150.h,
          color: AppColors.colors.whiteCatskill,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 6.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: CommonFormField(
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: "Communication",labelText: "Required Soft Skills",prefixIcon: Icon(Icons.stacked_bar_chart_rounded,color: AppColors.colors.blueColors,),)),
                    SizedBox(width: 10.w,),
                    IconButton(
                      onPressed: (){}, icon: Icon(Icons.add,size: 20.sp,),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: AppColors.colors.greyRegent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        elevation: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h)
                    ),)
                  ],
                ),
                Wrap(
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
