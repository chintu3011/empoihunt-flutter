import 'package:emploiflutter/frame_work/controller/campus_placement_controller/campus_placement_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/campus_placement_model/campus_placement_model.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CampusDetailTable extends ConsumerWidget {
  final CampusPlacementModel campusPlacementModel;
  const CampusDetailTable(this.campusPlacementModel, {super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final campusPlacement = ref.watch(campusPlacementController);
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
        ...List.generate(campusPlacement.getJobRoleList(campusPlacementModel.tVacancy!).length, (index) {
          final tableData = campusPlacement.getJobRoleList(campusPlacementModel.tVacancy!)[index];
          return Visibility(
            visible: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: const Color(0xffdee8e7),
                    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 6.w),
                    child: Text(
                      tableData["role"],
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
                    tableData["vacancy"],
                    style: TextStyles.w400.copyWith(fontSize: 12.sp, color: AppColors.colors.blueDark),
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
