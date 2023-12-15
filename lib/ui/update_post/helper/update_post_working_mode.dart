import 'package:emploiflutter/frame_work/controller/manage_job_post_controller/manage_job_post_controller.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class UpdatePostWorkingMode extends ConsumerWidget {
  const UpdatePostWorkingMode({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final managePostJobWatch = ref.watch(manageJobPostController);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColors.colors.whiteColors,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.colors.blueColors),
                ),
                child: Column(
                    children: List.generate(
                        managePostJobWatch.workingModeList.length, (index) {
                      final radioButton = managePostJobWatch.workingModeList[index];
                      return RadioListTile(
                        selected: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                          title: Text(
                            radioButton.title,
                            style: TextStyles.w400.copyWith(
                                fontSize: 12.sp, color: AppColors.colors.blackColors),
                          ),
                          value: radioButton.value,
                          groupValue: managePostJobWatch.selectedWorkingModeValue,
                          onChanged: (value) {
                            managePostJobWatch.updateSelectedValue(value!);
                          });
                    })),
              ),
              Positioned(
                top: 0,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.only(top: 8.h),
                  color: AppColors.colors.whiteColors,
                  child: Text("Working Mode",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                ),
              )
            ],
          ),
        ),
        managePostJobWatch.isSelectRemoteValue?Text("Please Select organization logo",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: Colors.red.shade400,),).paddingVertical(4):const SizedBox(),
      ],
    );
  }
}
