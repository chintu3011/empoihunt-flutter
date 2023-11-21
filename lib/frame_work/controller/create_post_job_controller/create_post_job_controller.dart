import 'package:emploiflutter/ui/utils/theme/theme.dart';

final createPostJobController = ChangeNotifierProvider((ref) => CreatePostJobController());

class CreatePostJobController extends ChangeNotifier{



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


}

class RadioButtonModel{
  final String title;
  final String value;

  RadioButtonModel({required this.title, required this.value});

}