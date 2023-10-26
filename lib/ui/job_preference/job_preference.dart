import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class JobPreference extends StatelessWidget {
  const JobPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.grey.shade300,
        title: Text("Job Preference",style: TextStyles.w500.copyWith(fontSize:16.sp,color: AppColors.colors.blackColors),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("what type of job are you looking",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                Text("1/5",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors))
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6.5,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.colors.whiteColors,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("Flutter Developer",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),softWrap: true,)),
                          Text("10 LPA +",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blueColors),)
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ahmedabad",style: TextStyles.w500.copyWith(fontSize: 14.sp,color: AppColors.colors.blackColors),),
                          Icon(Icons.keyboard_double_arrow_right_outlined,color: AppColors.colors.clayColors,size: 25,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height: 10.h,),
            CommonButton(btnText: "+ Add Job Preference", onPressed: (){},backgroundColor: AppColors.colors.whiteColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),side: BorderSide(color: AppColors.colors.blueColors)),textColor: AppColors.colors.blackColors,fontSize: 14.sp,txtPadding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 10.h),onPrimary: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
