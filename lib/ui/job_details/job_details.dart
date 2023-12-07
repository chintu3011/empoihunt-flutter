import 'package:emploiflutter/frame_work/controller/home_controller/job_seeker_home_controller/job_seeker_home_controller.dart';
import 'package:emploiflutter/frame_work/controller/job_details_controller/job_details_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/job_post_model/job_post_model.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_above_part.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_appbar.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_below_part.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class JobDetails extends ConsumerStatefulWidget {
  final JobPostModel jobDetail;
  const JobDetails({super.key,required this.jobDetail});

  @override
  ConsumerState<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends ConsumerState<JobDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.jobDetail.iIsApplied);
    print(widget.jobDetail.iIsSaved);
    print(ref.read(jobDetailsController).isFavorite);
  }
  @override
  Widget build(BuildContext context) {
    final jobDetailsWatch = ref.watch(jobDetailsController);
    jobDetailsWatch.scrollController.addListener(() {
      jobDetailsWatch.updateOffSetValue(jobDetailsWatch.scrollController.offset);
    });
    return PopScope(
      canPop: true,
      onPopInvoked: (value){
        if(value == jobDetailsWatch.isAnythingUpdated){
          ref.watch(jobSeekerHomeController).jobsPostApiCall();
        }
        jobDetailsWatch.updateIsAnythingUpdated();
        // if(value == jobDetailsWatch.isApplied || value == jobDetailsWatch.isFavorite){
        //   ref.watch(jobSeekerHomeController).jobsPostApiCall();
        // }else if (jobDetailsWatch.isFavorite == false){
        //   ref.watch(jobSeekerHomeController).jobsPostApiCall();
        // }
      },
      child: Scaffold(
        appBar:  JobDetailsAppBar(jobDetailModel: widget.jobDetail,),
        body: Column(
          children: [
             Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: jobDetailsWatch.scrollController,
                child:  Column(
                  children: [ JobDetailsAbovePart(jobPostModel: widget.jobDetail,),  JobDetailsBelowPart(jobPostModel: widget.jobDetail,),Container(height: 100,)],
                ),
              ),
            ),
            widget.jobDetail.iIsApplied == 1 || jobDetailsWatch.isApplied?
            CommonButton(
              btnText: "Already Applied",
              fontSize: 16.sp,
              onPressed: null,
              txtPadding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              backgroundColor: const Color(0xff85AFA6),
            ):
            CommonButton(
              btnText: "Apply",
              fontSize: 16.sp,
              onPressed: () {
                print(widget.jobDetail.id);
                jobDetailsWatch.appliedApi(widget.jobDetail.id.toString(), context, widget.jobDetail.vCompanyName!);
              },
              txtPadding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              backgroundColor: AppColors.colors.clayColors,
            ).paddingOnly(bottom: 6.h)
          ],
        ),
      ),
    );
  }
}
