import 'package:emploiflutter/frame_work/controller/create_post_job_controller/create_post_job_controller.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final updatePostController = ChangeNotifierProvider((ref) => UpdatePostController());

class UpdatePostController extends ChangeNotifier{


  ///--------------- Working Mode ----------------///
  String selectedValue = "";
  List<RadioButtonModel> workingModeList = [
    RadioButtonModel(title: "On-Site", value: "On-Site"),
    RadioButtonModel(title: "Remote", value: "Remote"),
    RadioButtonModel(title: "Hybrid", value: "Hybrid"),
  ];
  updateSelectedValue(String value){
    selectedValue = value;
    notifyListeners();
    // print(selectedValue);
  }
  ///--------------- Working Mode ----------------///

  ///----------------- DropDown Filed -----------------///
  final jobLocationSearchController = TextEditingController();
  String? selectedJobLocation;
  updateSelectedJobLocation(String? value) {
    selectedJobLocation = value;
    notifyListeners();
  }

  final qualificationSearchController = TextEditingController();
  String? selectedQualification;
  updateSelectedQualification(String? value) {
    selectedQualification = value;
    notifyListeners();
  }
///----------------- DropDown Filed -----------------///


}