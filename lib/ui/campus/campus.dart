import 'package:emploiflutter/frame_work/repository/model/campus_job_details_model/campus_job_detail_model.dart';
import 'package:emploiflutter/ui/campus/helper/campus_appbar.dart';
import 'package:emploiflutter/ui/campus/helper/campus_detail_card.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import 'helper/campus_placement_appbar.dart';

class Campus extends StatelessWidget {
  const Campus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CampusPlacementAppbar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
          child:  Column(
              children: List.generate(
                  campusJobDetails.length, (index) {
                final campusJobDetail = campusJobDetails[index];
                return  CampusDetailCard(campusJobDetailModel: campusJobDetail,);
              })
          ),
        ),
      ),
    );
  }
}



List<CampusJobDetailModel> campusJobDetails= [
  CampusJobDetailModel(companyName: "Amri Systems",address: "501,PNTC, Radio mirchi road, ahmedabad", date: "21-5-2023", tableData: [
    CampusDetailTableModel(jobRole: "Android Developer", vacancy: 2),
    CampusDetailTableModel(jobRole: "web Developer", vacancy: 1),
  ], qualification: [
    "BE","MCA","Diploma","Bsc"
  ]),
  CampusJobDetailModel(companyName: "Parth Institute",address: "501,PNTC, Radio mirchi road, ahmedabad", date: "14-10-2023", tableData: [
    CampusDetailTableModel(jobRole: "Flutter Developer", vacancy: 5),
    CampusDetailTableModel(jobRole: "Full Stack Developer", vacancy: 1),
  ], qualification: [
    "BE","MCA","Diploma","Bsc"
  ]),
  CampusJobDetailModel(companyName: "Hackers Systems",address: "501,PNTC, Radio mirchi road, ahmedabad", date: "05-5-2023", tableData: [
    CampusDetailTableModel(jobRole: "Ethical hacking", vacancy: 2),
    CampusDetailTableModel(jobRole: "Cyber security Developer", vacancy: 1),
  ], qualification: [
    "BE","MCA","Diploma","Bsc"
  ]),
];