import 'package:emploiflutter/ui/home/helper/recruiter/helper/recruiter_profile_card.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class RecruiterListTile extends StatelessWidget {
  const RecruiterListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 18.h),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.colors.blueColors,width: 1.5),
            ),
            child:  Row(
              children: [
                 SizedBox(width: 115.w,),
                 Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Engineer",style: TextStyles.w500.copyWith(fontSize: 15.sp,color: AppColors.colors.blueColors),),
                        Text("12 LPA +",style: TextStyles.w500.copyWith(fontSize: 15.sp,color: AppColors.colors.clayColors),)
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text("Bachelor of Engineering(BE)",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 15.h,),
                    Text("3+ Years Experience",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.colors.blueDark
                          ),
                          child: Text("Pune",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                        ),
                        SizedBox(width: 8.w,),
                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.colors.clayColors
                          ),
                          child: Text("On-site",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                        )
                      ],
                    )
                  ],
                ).paddingSymmetric(vertical: 17.h,horizontal: 10.w))
              ],
            ),
          ),
          const RecruiterProfileCard(),



          ///------------------ Call and mail share Icons ----------///
          Positioned(
            bottom: 0,
            right: 10.w,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.phone,color: AppColors.colors.blackColors,size: 22.sp,),style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(5.sp),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r),side: BorderSide(color: Colors.grey.withOpacity(0.3))),
                    elevation: 8,
                    backgroundColor: AppColors.colors.whiteColors
                ),),
                SizedBox(width: 13.w,),
                IconButton(onPressed: (){}, icon: Icon(Icons.mail,color: AppColors.colors.blackColors,size: 22.sp,),style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(5.sp),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r),side: BorderSide(color: Colors.grey.withOpacity(0.3))),
                    elevation: 8,
                    backgroundColor: AppColors.colors.whiteColors
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
