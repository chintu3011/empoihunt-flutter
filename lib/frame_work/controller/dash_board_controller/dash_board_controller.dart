import 'package:emploihunt/ui/campus/campus.dart';
import 'package:emploihunt/ui/create_post_job/create_post_job.dart';
import 'package:emploihunt/ui/home/helper/job_seeker/job_seeker_home.dart';
import 'package:emploihunt/ui/home/helper/recruiter/recruiter_home.dart';
import 'package:emploihunt/ui/settings/setting.dart';
import 'package:emploihunt/ui/utils/theme/theme.dart';

import '../../../ui/ai_for_jobseeker/ai_for_jobseeker.dart';

final dashBoardController = ChangeNotifierProvider((ref) => DashBoardController());

class DashBoardController extends ChangeNotifier{

  int selectedIndex = 0;


  updateSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> jobSeekerPages = [
    const JobSeekerHome(),
    const Campus(),
    ///Temporary stop fetching data
    const AIForJobSeeker(),
    const Setting()
  ];

  List<Widget> recruiterPages = [
    const RecruiterHome(),
    const CreatePostJob(),
    const Setting()
  ];

  otherWidgetAllowToNavigate(int index){
    selectedIndex = index;
    notifyListeners();
  }
}