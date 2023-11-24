import 'package:emploiflutter/ui/update_post/update_post.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../utils/theme/text_styles.dart';

class ManageJobTile extends ConsumerWidget {
  const ManageJobTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h,bottom: 5.h),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.colors.blueColors,width: 1.5),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Android Developer",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blueColors),),
                  Text("12 LPA +",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.clayColors),)
                ],
              ),
              SizedBox(height: 10.h,),

              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Card(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: AppColors.colors.clayColors),
                      child: Text(
                        "2 Years",
                        style: TextStyles.w400.copyWith(
                            fontSize: 14.sp, color: AppColors.colors.whiteColors),
                      ),
                    ),
                  ),

                  Card(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: AppColors.colors.clayColors),
                      child: Text(
                        "Bachelor of Hotel Management(BHM)",
                        style: TextStyles.w400.copyWith(
                            fontSize: 14.sp, color: AppColors.colors.whiteColors),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),

              Row(
                children: [
                  Text("test • ",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                  SizedBox(width: 8.w,),
                  Text("5 Vacancy",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),)
                ],
              ),
              SizedBox(height: 8.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ahmedabad",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
                  Text("23 hours ago",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),)
                ],
              )
            ],
          ).paddingSymmetric(vertical: 17.h,horizontal: 10.w),
        ),
        ///------------------ edit and delete Icons ----------///
        Positioned(
          top: 0,
          right: 5.w,
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const UpdatePost()));
              }, icon: Icon(Icons.edit,color: AppColors.colors.whiteColors,size: 22.sp,),style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(5.sp),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r),side: BorderSide(color: Colors.grey.withOpacity(0.3))),
                  elevation: 8,
                  backgroundColor: AppColors.colors.blueColors
              ),),
              SizedBox(width: 8.w,),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: AppColors.colors.whiteColors,size: 22.sp,),style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(5.sp),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r),side: BorderSide(color: Colors.grey.withOpacity(0.3))),
                  elevation: 8,
                  backgroundColor: AppColors.colors.blueColors
              ),),
            ],
          ),
        )
      ],
    );
  }
}
