import 'package:emploiflutter/ui/contact_us/contact_us.dart';
import 'package:emploiflutter/ui/job_preference/job_preference.dart';
import 'package:emploiflutter/ui/privacy_policy/privacy_policy.dart';
import 'package:emploiflutter/ui/save_job/save_job.dart';
import 'package:emploiflutter/ui/terms_and_condition/terns_and_condition.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/view_applylist/view_applylist.dart';

final settingController = ChangeNotifierProvider((ref) => SettingController());

class SettingController extends ChangeNotifier{


///--------------Job Seeker-----------------///
  List<Map<String,dynamic>> seekerSettingList=[
    {"Icon": Icons.person,"Text":"View ApplyList"},
    {"Icon": Icons.app_settings_alt,"Text":"Job Preference"},
    {"Icon": Icons.save,"Text":"Save Job"},
    {"Icon": Icons.phone,"Text":"Contact Us"},
    {"Icon": Icons.security,"Text":"Privacy Policy"},
    {"Icon": Icons.menu_book_rounded,"Text":"Terms & Condition"},
  ];

  navigatingToList(int index,BuildContext context){
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const ViewApplyList()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const JobPreference()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const SaveJob()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const ContactUs()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const PrivacyPolicy()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const TermsAndCondition()));
        break;
    }
  }
///--------------Job Seeker-----------------///

///--------------Recruiter ----------------////
  List<Map<String,dynamic>> recruiterSettingList=[
    {"Icon": Icons.work,"Text":"View ApplyList"},
    {"Icon": Icons.person,"Text":"Job Preference"},
    {"Icon": Icons.phone,"Text":"Contact Us"},
    {"Icon": Icons.security,"Text":"Privacy Policy"},
    {"Icon": Icons.menu_book_rounded,"Text":"Terms & Condition"},
  ];
///--------------Recruiter ----------------////
}