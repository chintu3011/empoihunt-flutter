import 'package:emploiflutter/frame_work/controller/create_post_job_controller/create_post_job_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CreatePostJobWorkingMode extends ConsumerWidget {
  const CreatePostJobWorkingMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPostJobWatch = ref.watch(createPostJobController);
    return Container(
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
                    createPostJobWatch.workingModeList.length, (index) {
              final radioButton = createPostJobWatch.workingModeList[index];
              return RadioListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  title: Text(
                    radioButton.title,
                    style: TextStyles.w300.copyWith(
                        fontSize: 12.sp, color: AppColors.colors.blackColors),
                  ),
                  value: radioButton.value,
                  groupValue: createPostJobWatch.selectedValue,
                  onChanged: (value) {
                    createPostJobWatch.updateSelectedValue(value!);
                  });
            })),
          ),
          Positioned(
            top: 0,
            left: 12.w,
            child: Container(
              padding: EdgeInsets.only(top: 8.h),
              color: AppColors.colors.whiteColors,
              child: Text("Working Mode",style: TextStyles.w200.copyWith(fontSize: 10.sp,color: AppColors.colors.blackColors),),
            ),
          )
        ],
      ),
    );
  }
}
