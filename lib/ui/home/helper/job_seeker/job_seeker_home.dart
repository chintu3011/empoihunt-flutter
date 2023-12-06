import 'package:emploiflutter/frame_work/controller/home_controller/job_seeker_home_controller/job_seeker_home_controller.dart';
import 'package:emploiflutter/ui/home/helper/job_seeker/helper/job_seeker_appbar.dart';
import 'package:emploiflutter/ui/home/helper/job_seeker/helper/job_seeker_list_card.dart';
import 'package:emploiflutter/ui/job_details/job_details.dart';
import 'package:emploiflutter/ui/messenger_modul/messenger/messanger.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';


class JobSeekerHome extends ConsumerStatefulWidget {
  const JobSeekerHome({super.key});

  @override
  ConsumerState<JobSeekerHome> createState() => _JobSeekerHomeState();
}

class _JobSeekerHomeState extends ConsumerState<JobSeekerHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(jobSeekerHomeController).jobsPostApiCall();
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    final jobSeekerHomeWatch = ref.watch(jobSeekerHomeController);
    return Scaffold(
      appBar: const JobSeekerAppbar(),
      body: Stack(
        children: [
          jobSeekerHomeWatch.isLoading? const Center(child: CircularProgressIndicator(),) :
          jobSeekerHomeWatch.jobPostList.isEmpty?  const Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
              child: Column(
                  children:
                  List.generate(jobSeekerHomeWatch.jobPostList.length, (index) {
                final jobList = jobSeekerHomeWatch.jobPostList[index];
                return JobSeekerListCard(
                  jobPostModel: jobList,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) =>  JobDetails(jobDetail: jobList,)));
                  },
                );
              })
              ) ,
            ),
          ),
          Positioned(
              right: 0,
              top: 35.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Messenger()));
                },
                child: Container(
                  height: 80.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: AppColors.colors.clayColors,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r)),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}


