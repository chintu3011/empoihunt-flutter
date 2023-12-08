import 'package:emploiflutter/frame_work/controller/campus_placement_controller/campus_placement_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/campus_job_details_model/campus_job_detail_model.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/campus_placement_model/campus_placement_model.dart';
import 'package:emploiflutter/ui/campus/helper/campus_bottom_sheet.dart';
import 'package:emploiflutter/ui/campus/helper/campus_detail_table.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/text_styles.dart';

class CampusDetailCard extends ConsumerWidget {
  final CampusPlacementModel campusJobDetailModel;
  const CampusDetailCard({super.key, required this.campusJobDetailModel, });


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final campusPlacementWatch = ref.watch(campusPlacementController);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(bottom: 10.h),
      child: Card(
        elevation: 7,
        color: Colors.grey,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: size.width * 0.96,
          decoration: BoxDecoration(
              color: AppColors.colors.whiteCatskill,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width.w,
                height: 3.h,
                color: AppColors.colors.clayColors,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: size.width * 0.4,
                            child: Text(campusJobDetailModel.vCampusName!,style: TextStyles.w500.copyWith(fontSize: 30.sp,color: AppColors.colors.blueColors),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                        Container(
                          width: size.width * 0.43,
                          padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 6.h),
                          decoration: BoxDecoration(
                              color: AppColors.colors.clayColors,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r))
                          ),
                          child: FittedBox(child: Text("-26d -21h -17m Remaining",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),)),
                        ),
                      ],
                    ),
                    campusJobDetailModel.tCampusAddress !=null?Text(campusJobDetailModel.tCampusAddress!,style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),):const SizedBox(

                    ),
                  ],
                ),
              ),
              Container(
                width: size.width.w,
                height: 3.h,
                color: AppColors.colors.blueColors,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 3.h),
                  decoration: BoxDecoration(
                      color: AppColors.colors.blueColors,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r))
                  ),
                  child: FittedBox(child: Text("8-12-2023",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h,bottom: 12.h,right: 4.w,left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Required job Role",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                        // campusPlacementWatch.getJobRoleList(campusJobDetailModel.tVacancy!).length >=3?
                        // IconButton(onPressed: (){
                        //   campusPlacementWatch.updateIsShowAllTheJobRole();
                        // }, icon:campusPlacementWatch.isShowAllTheJobRole?const Icon(Icons.arrow_downward_outlined):const Icon(Icons.arrow_upward_outlined)):
                        // const SizedBox()
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    CampusDetailTable(campusJobDetailModel),
                    SizedBox(height: 12.h,),
                    Text("Required qualification",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                    SizedBox(height: 12.h,),
                    Row(
                      children: List.generate(campusPlacementWatch.getQualification(campusJobDetailModel.vQualification!).length, (index) {
                        final qualification = campusPlacementWatch.getQualification(campusJobDetailModel.vQualification!)[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                          padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 3.h),
                          decoration: BoxDecoration(
                              color: AppColors.colors.whiteColors,
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: AppColors.colors.blueColors,width: 1.w)
                          ),
                          child: Text(qualification,style: TextStyles.w300.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      context: context,
                      builder: (context) =>  CampusBottomSheet(companyName: campusJobDetailModel.vCampusName!));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.colors.blueColors,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r))
                  ),
                  child: Text("Register",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: AppColors.colors.whiteColors),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
