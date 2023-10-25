import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/frame_work/repository/model/campus_job_details_model/campus_job_detail_model.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CampusDetailTable extends StatelessWidget {
  final CampusJobDetailModel campusJobDetailModel;
  const CampusDetailTable({super.key, required this.campusJobDetailModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: const Color(0xff709baa),
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  "Job Role",
                  style: TextStyles.w400.copyWith(fontSize: 16.sp, color: AppColors.colors.blueColors),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.3,
              color: AppColors.colors.clayColors,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Text(
                "Vacancy",
                style: TextStyles.w400.copyWith(fontSize: 16.sp, color: AppColors.colors.blueColors),
              ),
            ),
          ],
        ),
        ...List.generate(campusJobDetailModel.tableData.length, (index) {
          final tableData = campusJobDetailModel.tableData[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xffdee8e7),
                  padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 6.w),
                  child: Text(
                    tableData.jobRole,
                    style: TextStyles.w400.copyWith(fontSize: 12.sp, color: AppColors.colors.blueColors),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.3,
                alignment: Alignment.center,
                color: const Color(0xffE0EEEA),
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  tableData.vacancy.toString(),
                  style: TextStyles.w400.copyWith(fontSize: 12.sp, color: AppColors.colors.blueDark),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
