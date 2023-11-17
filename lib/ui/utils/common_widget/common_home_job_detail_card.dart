import 'package:emploiflutter/frame_work/repository/model/home_job_detail_model/home_job_detail_model.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CommonHomeJobDetailCard extends StatelessWidget {
  final HomeJobDetailModel homeJobDetailModel;
  final void Function()? onTap;
  const CommonHomeJobDetailCard({super.key, required this.homeJobDetailModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 10.h),
        child: Card(
          elevation: 7,
          color: Colors.grey,
          child: Container(
            width: size.width * 0.96,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: AppColors.colors.whiteColors,
                borderRadius: BorderRadius.circular(4.r)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        homeJobDetailModel.jobTitle,
                        style: TextStyles.w500.copyWith(
                            fontSize: 14.sp, color: AppColors.colors.blackColors),
                      ),
                    ),
                    Text(
                      "${homeJobDetailModel.lpa} LPA+",
                      style: TextStyles.w500.copyWith(
                          fontSize: 14.sp, color: AppColors.colors.blackColors),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Card(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.colors.clayColors),
                        child: Text(
                          "${homeJobDetailModel.year} Years",
                          style: TextStyles.w400.copyWith(
                              fontSize: 12.sp, color: AppColors.colors.whiteColors),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.colors.clayColors),
                          child: Text(
                            homeJobDetailModel.degree,
                            style: TextStyles.w400.copyWith(
                                fontSize: 12.sp, color: AppColors.colors.whiteColors),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      homeJobDetailModel.companyName,
                      style: TextStyles.w500.copyWith(
                          fontSize: 12.sp, color: AppColors.colors.blackColors),
                    ),
                    Text(
                      "${homeJobDetailModel.vacancy} Vacancy",
                      style: TextStyles.w500.copyWith(
                          fontSize: 12.sp, color: AppColors.colors.blackColors),
                    ),
                  ],
                ),
                SizedBox(height: 10..h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(
                            AppAssets.profilePicPng,
                          ),
                          foregroundImage: AssetImage(AppAssets.profilePicPng),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          homeJobDetailModel.hrName,
                          style: TextStyles.w400.copyWith(
                              fontSize: 11.sp, color: AppColors.colors.blackColors),
                        ),
                      ],
                    ),
                    Text(
                      homeJobDetailModel.location,
                      style: TextStyles.w400
                          .copyWith(fontSize: 11.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  height: 4.h,
                  color: AppColors.colors.blueColors,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h,bottom: 18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       homeJobDetailModel.description,
                        style: TextStyles.w400
                            .copyWith(fontSize: 10.sp, color: Colors.grey),
                      ),
                      Text(
                        "${homeJobDetailModel.days} days ago",
                        style: TextStyles.w400
                            .copyWith(fontSize: 10.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
