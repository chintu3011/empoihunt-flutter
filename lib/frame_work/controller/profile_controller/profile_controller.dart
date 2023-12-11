import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/choose_user_role_controller/choose_user_role_controller.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_banner_image_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_current_position_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_experience_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_about_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_details_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_profile_image_change_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_qualification_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_resume_dialogbox.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import '../../../ui/utils/app_constant.dart';
import '../../repository/model/user_model/user_experience_model.dart';
import '../../repository/services/hive_service/box_service.dart';

final profileController = ChangeNotifierProvider((ref) => ProfileController(ref));

class ProfileController extends ChangeNotifier {
  Ref ref;
  ProfileController(this.ref);

  bool isDialogShow = false;
  int dialogValue = 0;


  ///---------------- get user data from hive storage --------------------///
  ///
  final userModelData = BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user;


  ///---------------- get user data from hive storage --------------------///


  ///----------------User Experience Api call and Store Data on hive -----------------------///

    List<UserExperienceModel> userExperienceList = [];
    Future getUserExperienceApi()async{
      userExperienceList = [];
    try{
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
        Options options = Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user?.tAuthToken}',
            }
        );
      Response response = await DioClient.client.getDataWithBearerToken(APIEndPoint.userExperienceApi,options);
      if(response.statusCode == 200){
        List responseData = response.data["data"];
        for(dynamic i in responseData) {
          UserExperienceModel job = UserExperienceModel.fromJson(i);
            userExperienceList.add(job);
        }
        print(response.data['data']);
      }
    }catch(e){
      Future.error(e);
    }
    }

  ///----------------User Experience Api call and Store Data on hive -----------------------///


  ///----------- Form keys ----------------///

    final GlobalKey<FormState> userDetailFormKey = GlobalKey();
    final GlobalKey<FormState> aboutFormKey = GlobalKey();
    final GlobalKey<FormState> currentPositionFormKey = GlobalKey();
    final GlobalKey<FormState> experienceAddFormKey = GlobalKey();
    final GlobalKey<FormState> experienceUpdateFormKey = GlobalKey();

  ///----------- Form keys ----------------///



  ///--------- User Detail Change ------------- ///

  final jobLocationSearchController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final expertiseController = TextEditingController();

  List<String> expertiseList=[];
  bool isExpertiseAdded = false;
  addExpertise(){
    if(expertiseController.text !=""){
      expertiseList.add(expertiseController.text);
      isExpertiseAdded = false;
      expertiseController.clear();
    }
    notifyListeners();
  }
  String? userDetailSelectedJobLocation;
  bool isUserDetailsJobSelect = false;

  updateSelectedJobLocation(String? value) {
    userDetailSelectedJobLocation = value;
    isUserDetailsJobSelect = false;
    notifyListeners();
  }

  userDetailChangeCancelButton(){
    clearUserDetailForms();
    updateIsDialogShow();
    notifyListeners();
  }

  clearUserDetailForms(){
    firstNameController.clear();
    lastNameController.clear();
    expertiseController.clear();
    expertiseList = [];
    userDetailSelectedJobLocation = null;
    emailController.clear();
    notifyListeners();
  }

  userDetailChangeDoneButton(){
    if(userDetailFormKey.currentState!.validate()){
      if(expertiseList.isNotEmpty){
        isExpertiseAdded = false;
        if(userDetailSelectedJobLocation != null){
          isUserDetailsJobSelect = false;
          /// Success
          updateIsDialogShow();
          clearUserDetailForms();
        }else{
          isUserDetailsJobSelect = true;
        }
      }else{
        isExpertiseAdded = true;
      }
    }
    notifyListeners();
  }

  ///--------- User Detail Change ------------- ///


  ///---------------- About Change ------------------///

  final bioController = TextEditingController();
  bioCancelButton(){
    updateIsDialogShow();
    bioController.clear();
    notifyListeners();
  }
  bioDoneButton(){
    if(aboutFormKey.currentState!.validate()){
      debugPrint("Success");
      updateIsDialogShow();
      bioController.clear();
    }
    notifyListeners();
  }

  ///---------------- About Change ------------------///

  ///---------------- Show dialog according to its value --------------///

  updateIsDialogShow() {
    isDialogShow = !isDialogShow;
    notifyListeners();
  }

  setDialogValue(int value) {
    dialogValue = value;
    notifyListeners();
  }


  /// ------------ for Job Seeker ------------///
  jobSeekerShowDialogs() {
    final userRoleWatch = ref.watch(chooseUserRoleController);
    if (dialogValue == 0) {
      return const UserBannerImageDialogBox();
    } else if (dialogValue == 1) {
      return const UserProfileImageChangeDialogBox();
    } else if (dialogValue == 2) {
      return const UserDetailsDialogBox();
    } else if (dialogValue == 3) {
      return const UserAboutDialogBox();
    } else if (dialogValue == 4) {
      return const UserQualificationDialogBox();
    }else if(dialogValue == 5){
      return userRoleWatch.userRole  == 0? const UserExperienceDialogBox() : const UserCurrentPositionDialogBox();
    }else if(dialogValue == 6){
      return const UserResumeDialogBox();
    }
    notifyListeners();
  }
  /// ------------ for Job Seeker ------------///

  ///---------------- Show dialog according to its value --------------///


  /// ------ Banner Image ----///
  late AnimationController uploadBannerLottieController;

  bool isBannerAnimationRun = false;
  File? bannerImg;

  Future<void> pickBannerImg() async{
    isBannerAnimationRun = true;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg','png','jpeg']
    );
    bannerImg = null;
    notifyListeners();
    uploadBannerLottieController.stop();
    if(result != null){
      final PlatformFile file = result.files.first;
      // print("image name --->${file.name}");
      uploadBannerLottieController.reset();
      uploadBannerLottieController.forward();
      await Future.delayed(const Duration(seconds: 3),);
      bannerImg = File(file.path!);
      isBannerAnimationRun=false;
      notifyListeners();
    }else{
      uploadBannerLottieController.stop();
      isBannerAnimationRun=false;
      notifyListeners();
    }
    notifyListeners();
  }

  /// ------ Banner Image ----///



  /// ------ Banner Image ----///
  late AnimationController uploadProfileImgLottieController;

  bool isProfileImgAnimationRun = false;
  File? profileImg;

  Future<void> pickProfileImg() async{
    isProfileImgAnimationRun = true;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg','png','jpeg']
    );
    profileImg = null;
    notifyListeners();
    uploadProfileImgLottieController.stop();
    if(result != null){
      final PlatformFile file = result.files.first;
      // print("image name --->${file.name}");
      uploadProfileImgLottieController.reset();
      uploadProfileImgLottieController.forward();
      await Future.delayed(const Duration(seconds: 5),);
      profileImg = File(file.path!);
      isProfileImgAnimationRun=false;
      notifyListeners();
    }else{
      uploadProfileImgLottieController.stop();
      isProfileImgAnimationRun=false;
      notifyListeners();
    }
    notifyListeners();
  }
  /// ------ Banner Image ----///


  /// ------ resume Edit ----////
  late AnimationController resumeLottieController;

  String? fileName;
  File? pdfFile;

  Future<void> pickPdfFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    resumeLottieController.stop();
    if (result != null) {
      // print(file.name);
      // print(file.path);
      resumeLottieController.reset();
      resumeLottieController.forward();
      final PlatformFile file = result.files.first;
      fileName = file.name;
      notifyListeners();
    } else {
      resumeLottieController.stop();
    }
  }
  /// ------ resume Edit ----////




  /// ------ User Experience  ----////

  final userExperienceAddDesignFieldController = TextEditingController();
  final userExperienceAddCompanyNameFieldController = TextEditingController();
  final userExperienceAddSearchJobLocationFieldController = TextEditingController();
  final userExperienceAddDurationFieldController = TextEditingController();

  final userExperienceUpdateDesignFieldController = TextEditingController();
  final userExperienceUpdateCompanyNameFieldController = TextEditingController();
  final userExperienceUpdateSearchJobLocationFieldController = TextEditingController();
  final userExperienceUpdateDurationFieldController = TextEditingController();

  int selectedUserExperienceListIndex = -1;
  int updateItemIndex = 0;


  String? userExperienceUpdateSelectedJobLocation;
  bool isUserExperienceUpdateJobSelected = false;
  updateUserExperienceUpdateSelectedJobLocation(String? value) {
    userExperienceUpdateSelectedJobLocation = value;
    isUserExperienceUpdateJobSelected = false;
    notifyListeners();
  }
  bool checkBoxValUpdateForm = false;

  updateCheckBoxValUpdateForm(bool value){
    checkBoxValUpdateForm = value;
    notifyListeners();
  }

  updateListItemButton() {
    if(experienceUpdateFormKey.currentState!.validate()){
      if(userExperienceUpdateSelectedJobLocation != null){
        isUserExperienceUpdateJobSelected = false;

        userExperienceList[updateItemIndex] = UserExperienceModel(
            vDesignation: userExperienceUpdateDesignFieldController.text,
            vCompanyName: userExperienceUpdateCompanyNameFieldController.text,
            vJobLocation: userExperienceUpdateSelectedJobLocation!,
            vDuration: userExperienceUpdateDurationFieldController.text);

        /// Clear form after update ///
        userExperienceUpdateDesignFieldController.clear();
        userExperienceUpdateCompanyNameFieldController.clear();
        userExperienceUpdateSearchJobLocationFieldController.clear();
        userExperienceUpdateSelectedJobLocation =null;
        userExperienceUpdateDurationFieldController.clear();
        selectedUserExperienceListIndex = -1;
      }else{
        isUserExperienceUpdateJobSelected = true;
      }
    }
    notifyListeners();
  }


  bool checkBoxValAddForm = false;
  updateCheckBoxValAddForm(bool value){
    checkBoxValAddForm = value;
    notifyListeners();
  }


  listDeleteButton(int index){
    userExperienceList.removeAt(index);
    notifyListeners();
  }

  listEditButton({
    required int index,
    required String designation,
    required String companyName,
    required String jobLocation,
    String? duration,
  }) {
    if (selectedUserExperienceListIndex == index) {
      selectedUserExperienceListIndex = -1;
    } else {
      updateItemIndex = index;
      selectedUserExperienceListIndex = index;
      userExperienceUpdateDesignFieldController.text = designation;
      userExperienceUpdateCompanyNameFieldController.text = companyName;
      userExperienceUpdateSelectedJobLocation = jobLocation;
      userExperienceUpdateDurationFieldController.text = duration ?? "";
    }
    notifyListeners();
  }

  bool isExperienceExpanded = false;
  bool isExperienceAddShow = false;

  updateIsExperienceAddShow() {
    isExperienceAddShow = !isExperienceAddShow;
    isExperienceExpanded = true;
    notifyListeners();
  }

  String? userExperienceAddSelectedJobLocation;
  bool isUserExperienceAddJobSelected = false;
  updateUserExperienceAddSelectedJobLocation(String? value) {
    userExperienceAddSelectedJobLocation = value;
    isUserExperienceAddJobSelected = false;
    notifyListeners();
  }

  userExperienceAddButton() {
    // print(" add Button $userExperienceAddSelectedJobLocation");
    // print(" add designation $userExperienceAddDesignFieldController");
    // print(" add company name $userExperienceAddCompanyNameFieldController");
    if(experienceAddFormKey.currentState!.validate()){
      if(userExperienceAddSelectedJobLocation != null){
        isUserExperienceAddJobSelected = false;
        userExperienceList.add(UserExperienceModel(
            vDesignation: userExperienceAddDesignFieldController.text,
            vCompanyName: userExperienceAddCompanyNameFieldController.text,
            vJobLocation: userExperienceAddSelectedJobLocation!,
            vDuration: userExperienceAddDurationFieldController.text));

        /// Clear after adding ////
        userExperienceAddDesignFieldController.clear();
        userExperienceAddSearchJobLocationFieldController.clear();
        userExperienceAddDurationFieldController.clear();
        userExperienceAddSelectedJobLocation = null;
        userExperienceAddCompanyNameFieldController.clear();
        isExperienceAddShow = false;
      }else{
        isUserExperienceAddJobSelected = true;
      }
    }
    notifyListeners();
  }

  experienceOkButton(){
    updateIsDialogShow();
      selectedUserExperienceListIndex = -1;
      if (userExperienceList.isNotEmpty) {
        isExperienceExpanded = true;
      } else {
        isExperienceExpanded = false;
      }
  }
  /// ------ User Experience ----////



  /// ------ User Current Position ----////

  final userCurrentPosDesignFieldController = TextEditingController();
  final userCurrentPosCompanyNameFieldController = TextEditingController();
  final userCurrentPosSearchJobLocationController = TextEditingController();

  String? userCurrentPosSelectedJobLocation;
  bool isUserCurrentPosJobSelected = false;
  updateUserCurrentPosSearchJobLocationController(String? value) {
    userCurrentPosSelectedJobLocation = value;
    isUserCurrentPosJobSelected = false;
    notifyListeners();
  }

  List<String> workingModeList=[
    "On-Site",
    "Remote",
    "Hybrid",
  ];

  int selectedWorkingMode = 0;
  updateWorkingMode(int index){
    selectedWorkingMode = index;
    debugPrint(workingModeList[index]);
    notifyListeners();
  }
  clearCurrentPosForm(){
    userCurrentPosDesignFieldController.clear();
    userCurrentPosCompanyNameFieldController.clear();
    userCurrentPosSelectedJobLocation = null;
    selectedWorkingMode =0;
    notifyListeners();
  }
  currentPositionCancelButton(){
    updateIsDialogShow();
    clearCurrentPosForm();
  }

  currentPositionDoneButton(){
    if(currentPositionFormKey.currentState!.validate()){
      if(userCurrentPosSelectedJobLocation != null){
        isUserCurrentPosJobSelected = false;
        debugPrint("Success");
        updateIsDialogShow();
        clearCurrentPosForm();
      }else{
        isUserCurrentPosJobSelected =true;
      }
      notifyListeners();
    }
  }
  /// ------ User Current Position ----////



  /// ------ User Qualification ------- ///

  final qualificationSearchController = TextEditingController();
  bool isQualificationSelected = false;
  String? selectedQualification;

  updateSelectedQualification(String? value) {
    selectedQualification = value;
    isQualificationSelected = false;
    notifyListeners();
  }

  qualificationChangeCancelButton(){
    updateIsDialogShow();
    selectedQualification = null;
    notifyListeners();
  }

  qualificationChangeDoneButton(){
    if(selectedQualification != null){
      isQualificationSelected = false;
      updateIsDialogShow();
      selectedQualification = null;
    }else{
      isQualificationSelected = true;
    }
    notifyListeners();
  }


/// ------ User Qualification ------- ///

}


