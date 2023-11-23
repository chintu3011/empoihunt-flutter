import 'package:emploiflutter/ui/utils/theme/theme.dart';

final appliedCandidateListController = ChangeNotifierProvider((ref) => AppliedCandidateListController());

class AppliedCandidateListController extends ChangeNotifier{

  List<String> postJobList  =[
    'Web Developer',
    'Flutter Developer React Native Developer,',
    'React Native Developer, ',
    '.Net Developer',
  ];

  String selectedPostJob = "Select Your Posted Job";
  updateSelectedPostJob(String value){
    selectedPostJob = value;
    notifyListeners();
  }
}