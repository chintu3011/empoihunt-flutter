import 'package:emploiflutter/frame_work/controller/setting_controller/job_preference/job_preference_controller.dart';
import 'package:emploiflutter/ui/job_preference/add_job_preference.dart';
import 'package:emploiflutter/ui/job_preference/helper/job_preferene_tile.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/theme/text_styles.dart';

class JobPreference extends ConsumerStatefulWidget {
  const JobPreference({super.key});

  @override
  ConsumerState<JobPreference> createState() => _JobPreferenceState();
}

class _JobPreferenceState extends ConsumerState<JobPreference> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(jobPreferenceController).jobPreferenceApiCall();
    });
  }
  @override
  Widget build(BuildContext context) {
    final jobPreferenceWatch = ref.watch(jobPreferenceController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.grey.shade300,
        title: Text("Job Preference",style: TextStyles.w500.copyWith(fontSize:16.sp,color: AppColors.colors.blackColors),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 10.h),
        child:jobPreferenceWatch.isLoading? const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("what type of job are you looking",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                  Text("${jobPreferenceWatch.lenghtOfList}/5",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blackColors))
                ],
              ),
              ...List.generate(jobPreferenceWatch.jobPreferenceList.length, (index) { 
                final jobData = jobPreferenceWatch.jobPreferenceList[index];
                return JobPreferenceTile(jobData: jobData,);
              }),
              SizedBox(height: 10.h,),
              CommonButton(btnText:jobPreferenceWatch.lenghtOfList >=5?"Opps! job Preference Full": "+ Add Job Preference", onPressed:jobPreferenceWatch.lenghtOfList >=5 ?null:  (){
                jobPreferenceWatch.clearData();
                Navigator.push(context, PageTransition(child: const AddJobPreference(), type: PageTransitionType.rightToLeft,childCurrent: widget,duration: const Duration(milliseconds: 300)));
              },backgroundColor: AppColors.colors.whiteColors,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r),side: BorderSide(color: AppColors.colors.blueColors)),textColor: AppColors.colors.blackColors,fontSize: 12.sp,txtPadding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 10.h),onPrimary: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
