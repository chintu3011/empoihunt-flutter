import 'package:emploiflutter/frame_work/controller/job_details_controller/job_details_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/job_post_model/job_post_model.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_above_part.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_appbar.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_below_part.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class JobDetails extends ConsumerWidget {
  final JobPostModel jobDetail;
  const JobDetails({super.key,required this.jobDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobDetailsWatch = ref.watch(jobDetailsController);
    jobDetailsWatch.scrollController.addListener(() {
      jobDetailsWatch.updateOffSetValue(jobDetailsWatch.scrollController.offset);
    });
    return Scaffold(
      appBar:  JobDetailsAppBar(jobDetailModel: jobDetail,),
      body: Column(
        children: [
           Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: jobDetailsWatch.scrollController,
              child:  Column(
                children: [ JobDetailsAbovePart(jobPostModel: jobDetail,),  JobDetailsBelowPart(jobPostModel: jobDetail,),Container(height: 100,)],
              ),
            ),
          ),
          CommonButton(
            btnText: "Apply",
            fontSize: 16.sp,
            onPressed: () {},
            txtPadding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 10.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            backgroundColor: AppColors.colors.clayColors,
          ).paddingOnly(bottom: 6.h)
        ],
      ),
    );
  }
}
