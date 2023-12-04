import 'dart:io';

import 'package:emploiflutter/frame_work/controller/dash_board_controller/dash_board_controller.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';

final createPostJobController = ChangeNotifierProvider((ref) => CreatePostJobController(ref));

class CreatePostJobController extends ChangeNotifier{
  final Ref ref;
   CreatePostJobController(this.ref);

  final GlobalKey<FormState> formKey = GlobalKey();


  final jobTitleFieldController = TextEditingController();
  final companyNameFieldController = TextEditingController();
  final jobDescriptionFieldController = TextEditingController();
  final jobRoleRespFieldController = TextEditingController();
  final experienceFieldController = TextEditingController();
  final salaryFieldController = TextEditingController();
  final numberOfEmpFieldController = TextEditingController();

  ///--------------- Working Mode ----------------///
  String selectedRemoteValue = "";
  bool isSelectRemoteValue = false;
  List<RadioButtonModel> workingModeList = [
    RadioButtonModel(title: "On-Site", value: "On-Site"),
    RadioButtonModel(title: "Remote", value: "Remote"),
    RadioButtonModel(title: "Hybrid", value: "Hybrid"),
  ];
  updateSelectedValue(String value){
    selectedRemoteValue = value;
    notifyListeners();
    // print(selectedValue);
  }
///--------------- Working Mode ----------------///

/// -------Required Skills ----------------------///

  List<String> technicalSkillsList = [];
  List<String> softSkillsList = [];
  bool isTechnicalSkillEmpty = false;
  bool isSoftSkillEmpty = false;

  final requiredTechnicalSkillsController = TextEditingController();
  final requiredSoftSkillsController = TextEditingController();


  addTechnicalSkill(){
    if(requiredTechnicalSkillsController.text != ""){
      technicalSkillsList.add(requiredTechnicalSkillsController.text);
      requiredTechnicalSkillsController.clear();
      isTechnicalSkillEmpty = false;
    }
    notifyListeners();
  }

  addSoftSkill(){
    if(requiredSoftSkillsController.text != ""){
      softSkillsList.add(requiredSoftSkillsController.text);
      requiredSoftSkillsController.clear();
      isSoftSkillEmpty = false;
    }
    notifyListeners();
  }

/// -------Required Skills ----------------------///


///----------------- DropDown Filed -----------------///
  final jobLocationSearchController = TextEditingController();
  String? selectedJobLocation;
  bool isJobLocationSelect = false;
  updateSelectedJobLocation(String? value) {
    selectedJobLocation = value;
    isJobLocationSelect = false;
    notifyListeners();
  }

  final qualificationSearchController = TextEditingController();
  bool isQualificationSelected = false;
  updateIsQualificationSelected(String value){
    if(value != ""){
      isQualificationSelected = false;
    }else{
      isQualificationSelected = true;
    }
  }

  List<String> checkQualification(String query){
    query = query.toUpperCase().trim();
    return qualificationsList.where((education) => education.toUpperCase().trim().contains(query)).toList();
  }
///----------------- DropDown Filed -----------------///

/// ------------------ Bottom Buttons -----------------///
  postButton(){
    // print("Form key: ${formKey.currentState});
    if(formKey.currentState!.validate()){
      if(fileName != null){
        isFileSelected = false;
        if(technicalSkillsList.isNotEmpty){
          isTechnicalSkillEmpty =false;
          if(softSkillsList.isNotEmpty){
            isSoftSkillEmpty = false;
            if(qualificationSearchController.text != ""){
              isQualificationSelected = false;
              if(selectedJobLocation !=null){
                isJobLocationSelect = false;
                if(selectedRemoteValue !=""){
                  isSelectRemoteValue = false;
                  debugPrint("success");

                }else{
                  isSelectRemoteValue = true;
                }
              }else{
                isJobLocationSelect = true;
              }
            }else{
              isQualificationSelected = true;
            }
          }else{
            isSoftSkillEmpty =true;
          }
        }else{
          isTechnicalSkillEmpty =true;
        }
      }else{
        isFileSelected = true;
      }
    }
    notifyListeners();
  }
  cancelButton(){
    final dashBoardWatch = ref.watch(dashBoardController);
    dashBoardWatch.otherWidgetAllowToNavigate(0);
    notifyListeners();
    jobTitleFieldController.clear();
    companyNameFieldController.clear();
    jobDescriptionFieldController.clear();
    jobRoleRespFieldController.clear();
    experienceFieldController.clear();
    salaryFieldController.clear();
    numberOfEmpFieldController.clear();
    requiredTechnicalSkillsController.clear();
    requiredSoftSkillsController.clear();
    jobLocationSearchController.clear();
    qualificationSearchController.clear();

  }
/// ------------------ Bottom Buttons -----------------///

///------------------ Pick Company Logo ---------------------///
  String? fileName;
  bool isFileSelected = false;
  File? logoPicFile;
  Future<void> imagePicker() async{
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg','png','jpeg']
    );
    if(result != null){
      isFileSelected =false;
      final PlatformFile file = result.files.first;
      fileName = file.name;
      // print("image name --->${file.name}");
      logoPicFile = File(file.path!);
    }else{
    }
    notifyListeners();
  }

///------------------ Pick Company Logo ---------------------///

}

class RadioButtonModel{
  final String title;
  final String value;

  RadioButtonModel({required this.title, required this.value});

}