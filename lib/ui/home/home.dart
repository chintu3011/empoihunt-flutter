import 'package:emploiflutter/ui/MessengerModul/Messenger/messanger.dart';
import 'package:emploiflutter/ui/filter_job_preference/filter_job_preference.dart';
import 'package:emploiflutter/ui/home/helper/recruiter/recruiter_list_tile.dart';
import 'package:emploiflutter/ui/job_details/job_details.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/home/helper/job_seeker/job_seeker_list_card.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';

import '../../frame_work/repository/model/home_job_detail_model/home_job_detail_model.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    // final homeWatch = ref.watch(homeController);
    return Scaffold(
      appBar: CommonAppBar(
        title: "Find Best jobs Here",
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.search, color: AppColors.colors.blackColors,)),
          IconButton(onPressed: () {},
              icon: Icon(Icons.mic, color: AppColors.colors.blackColors,)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const FilterJobPreference()));             },
              icon: Icon(Icons.filter_alt_sharp, color: AppColors.colors.blackColors,)),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
              child: Column(
                  children:userRole == 0?
                      ///------ for Job Seeker ------///
                  List.generate(jobsLists.length, (index) {
                final jobList = jobsLists[index];
                return JobSeekerListCard(
                  homeJobDetailModel: jobList,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const JobDetails()));
                  },
                );
              }):
                  ///------- For Recruiter --------///
                  List.generate(10, (index) {
                    return const RecruiterListTile();
                  })
              ) ,
            ),
          ),
          // value == 0 ? const JobSeekerListTile():const RecruiterListTile(),
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



List<HomeJobDetailModel> jobsLists = [
  HomeJobDetailModel(
      jobTitle: "Android Developer",
      lpa: 2,
      year: 1,
      degree: "Bachelor of Technology",
      companyName: "Amri Systems",
      vacancy: 3,
      hrName: "Digvijay singh Shekhawat",
      location: "Ahmedabad",
      description: "sound knowledge of python",
      days: 20),
  HomeJobDetailModel(
      jobTitle: "CEO (Chief Executive Officer)",
      lpa: 2,
      year: 4,
      degree: "Bachelor of Pharmacy(B.Pharm)",
      companyName: "Amri Systems",
      vacancy: 5,
      hrName: "Manoj Patel",
      location: "Surat",
      description: "hard working",
      days: 21),
  HomeJobDetailModel(
      jobTitle: "Android Developer",
      lpa: 2,
      year: 1,
      degree: "Bachelor of Technology",
      companyName: "Amri Systems",
      vacancy: 3,
      hrName: "Digvijay singh Shekhawat",
      location: "Ahmedabad",
      description: "sound knowledge of python",
      days: 20),
  HomeJobDetailModel(
      jobTitle: "CEO (Chief Executive Officer)",
      lpa: 2,
      year: 4,
      degree: "Bachelor of Pharmacy(B.Pharm)",
      companyName: "Amri Systems",
      vacancy: 5,
      hrName: "Manoj Patel",
      location: "Surat",
      description: "hard working",
      days: 21),
  HomeJobDetailModel(
      jobTitle: "Android Developer",
      lpa: 2,
      year: 1,
      degree: "Bachelor of Technology",
      companyName: "Amri Systems",
      vacancy: 3,
      hrName: "Digvijay singh Shekhawat",
      location: "Ahmedabad",
      description: "sound knowledge of python",
      days: 20),
  HomeJobDetailModel(
      jobTitle: "CEO (Chief Executive Officer)",
      lpa: 2,
      year: 4,
      degree: "Bachelor of Pharmacy(B.Pharm)",
      companyName: "Amri Systems",
      vacancy: 5,
      hrName: "Manoj Patel",
      location: "Surat",
      description: "hard working",
      days: 21),
];