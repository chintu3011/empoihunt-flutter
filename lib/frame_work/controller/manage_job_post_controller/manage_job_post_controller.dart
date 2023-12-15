import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/controller/create_post_job_controller/create_post_job_controller.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';

import '../../../ui/utils/app_constant.dart';
import '../../../ui/utils/common_widget/helper.dart';
import '../../repository/api_end_point.dart';
import '../../repository/dio_client.dart';
import '../../repository/services/hive_service/box_service.dart';

final manageJobPostController = ChangeNotifierProvider((ref) => ManageJobPostController());

class ManageJobPostController extends ChangeNotifier{

  final GlobalKey<FormState> formKey = GlobalKey();

  final ScrollController scrollController = ScrollController();

  final jobTitleFocusNode = FocusNode();
  final jobTitleFieldController = TextEditingController();
  final companyNameFieldController = TextEditingController();
  final jobDescriptionFieldController = TextEditingController();
  final jobRoleRespFieldController = TextEditingController();
  final experienceFieldController = TextEditingController();
  final salaryFieldController = TextEditingController();
  final numberOfEmpFieldController = TextEditingController();

  ///--------------- Working Mode ----------------///
  String selectedWorkingModeValue = "";
  bool isSelectRemoteValue = false;
  List<RadioButtonModel> workingModeList = [
    RadioButtonModel(title: "On-Site", value: "On-Site"),
    RadioButtonModel(title: "Remote", value: "Remote"),
    RadioButtonModel(title: "Hybrid", value: "Hybrid"),
  ];
  updateSelectedValue(String value){
    selectedWorkingModeValue = value;
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

  String? techSkillTagline;

  techSkillToTagline(){
    techSkillTagline =null;
    for(String i in technicalSkillsList){
      techSkillTagline = "$technicalSkillsList${i.trim()},";
    }
  }

  String? softSkillTagline;

  softSkillToTagline(){
    softSkillTagline =null;
    for(String i in softSkillsList){
      softSkillTagline = "$softSkillsList${i.trim()},";
    }
  }
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

  final educationSearchController = TextEditingController();
  bool isEducationSelected = false;
  updateIsQualificationSelected(String value){
    if(value != ""){
      isEducationSelected = false;
    }else{
      isEducationSelected = true;
    }
  }

  List<String> checkEducation(String query){
    query = query.toUpperCase().trim();
    return qualificationsList.where((education) => education.toUpperCase().trim().contains(query)).toList();
  }
  ///----------------- DropDown Filed -----------------///

  /// ------------------ Bottom Buttons -----------------///
  postButton(BuildContext context)async{
    if(formKey.currentState!.validate()){
      if(imageName != ""){
        isFileSelected = false;
        if(technicalSkillsList.isNotEmpty){
          isTechnicalSkillEmpty =false;
          if(softSkillsList.isNotEmpty){
            isSoftSkillEmpty = false;
            if(educationSearchController.text != ""){
              isEducationSelected = false;
              if(selectedJobLocation !=null){
                isJobLocationSelect = false;
                if(selectedWorkingModeValue !=""){
                  isSelectRemoteValue = false;
                  debugPrint("success");
                  await postJobInsertApi(context);
                }else{
                  isSelectRemoteValue = true;
                }
              }else{
                isJobLocationSelect = true;
              }
            }else{
              isEducationSelected = true;
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
    }else{
      jobTitleFocusNode.requestFocus();
    }
    notifyListeners();
  }
  cancelButton(){
    notifyListeners();
    imageName ="";
    imgUrl =null;
    imageFile = null;
    techSkillTagline=null;
    softSkillTagline = null;
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
    educationSearchController.clear();
  }

  clearForm(){
    imageName ="";
    imgUrl =null;
    imageFile = null;
    techSkillTagline=null;
    softSkillTagline = null;
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
    educationSearchController.clear();
    notifyListeners();
  }
  /// ------------------ Bottom Buttons -----------------///

  ///------------------ Pick Company Logo ---------------------///
  String imageName ="";
  String? imgUrl;
  bool isFileSelected = false;
  File? imageFile;
  Future<void> imagePicker() async{
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg','png','jpeg']
    );
    if(result != null){
      isFileSelected =false;
      final PlatformFile file = result.files.first;
      imageName = file.name;
      imgUrl = file.path;
      imageFile = File(file.path!);
    }else{
    }
    notifyListeners();
  }

  ///------------------ Pick Company Logo ---------------------///

  Future postJobInsertApi(BuildContext context)async{
    try{
      techSkillToTagline();
      softSkillToTagline();
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
      if(user != null) {
        Options options = Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.tAuthToken}',
            }
        );
        FormData formData = FormData.fromMap(
            {
              "tCompanyPic":await MultipartFile.fromFile(imgUrl!, filename: imageName),
            });

        Response response = await DioClient.client
            .postDataWithFormWithBearerToken("${APIEndPoint.jobInsertApi}?vJobTitle=${jobTitleFieldController.text}&vCompanyName=${companyNameFieldController.text}&tDes=${jobDescriptionFieldController.text}&vJobLevel=""&vExperience=${experienceFieldController.text}&iNumberOfVacancy=${numberOfEmpFieldController.text}&vJobRoleResponsbility=${jobRoleRespFieldController.text}&tTechnicalSkill=$techSkillTagline&tSoftSkill=$softSkillTagline&vEducation=${educationSearchController.text}&vAddress=$selectedJobLocation&vSalaryPackage=${salaryFieldController.text}&vWrokingMode=$selectedWorkingModeValue",
            formData: formData,
            options: options);
        if(response.statusCode == 200){
          debugPrint("Job Post Done--------->");
          clearForm();
          scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
          if(context.mounted){
            showSnackBar(context: context, error: "Your Job Posted");}
          notifyListeners();
        }
      }
    }catch(e){

      Future.error("Post Job Insert API-------> $e");
    }
    notifyListeners();
  }


}

class RadioButtonModel{
  final String title;
  final String value;

  RadioButtonModel({required this.title, required this.value});

}