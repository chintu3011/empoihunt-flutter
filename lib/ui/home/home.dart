import 'package:emploiflutter/frame_work/controller/home_controller/home_controller.dart';
import 'package:emploiflutter/ui/MessengerModul/Messenger/messanger.dart';
import 'package:emploiflutter/ui/home/helper/home_appbar.dart';
import 'package:emploiflutter/ui/job_details/job_details.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_home_job_detail_card.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/frame_work/repository/model/home_job_detail_model/home_job_detail_model.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';


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
    final homeWatch = ref.watch(homeController);

    return Scaffold(
      appBar: const HomeAppbar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
              child: Column(
                  children: List.generate(
                      jobsLists.length, (index) {
                    final jobList = jobsLists[index];
                    return  CommonHomeJobDetailCard(homeJobDetailModel: jobList,onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const JobDetails()));
                    },);
                  })
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: 35.h,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const Messenger()));
                },
                child: Container(
                  height: 80.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: AppColors.colors.clayColors,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r),bottomLeft: Radius.circular(16.r)),
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
