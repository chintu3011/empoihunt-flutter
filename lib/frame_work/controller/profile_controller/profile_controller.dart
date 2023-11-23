import 'dart:io';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_banner_image_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_current_position_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_experience_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_about_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_details_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_profile_image_change_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_qualification_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_profile_dialogs/user_resume_dialogbox.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';

final profileController = ChangeNotifierProvider((ref) => ProfileController());

class ProfileController extends ChangeNotifier {
  bool isDialogShow = false;
  int dialogValue = 0;

  ///--------- User Detail Change ------------- ///

  final jobLocationSearchController = TextEditingController();
  String? selectedJobLocation;
  updateSelectedJobLocation(String? value) {
    selectedJobLocation = value;
    notifyListeners();
  }

  ///--------- User Detail Change ------------- ///

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
      return userRole == 0? const UserExperienceDialogBox() : const UserCurrentPositionDialogBox();
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

  List<UserExperienceModel> userExperienceList = [];
  int selectedUserExperienceListIndex = -1;
  int updateItemIndex = 0;


  String? userExperienceAddSelectedJobLocation;
  updateUserExperienceAddSelectedJobLocation(String? value) {
    userExperienceAddSelectedJobLocation = value;
    notifyListeners();
  }


  String? userExperienceUpdateSelectedJobLocation;
  updateUserExperienceUpdateSelectedJobLocation(String? value) {
    userExperienceUpdateSelectedJobLocation = value;
    notifyListeners();
  }


  updateListItemButton() {
    if (userExperienceUpdateDesignFieldController.text != "" &&
        userExperienceUpdateCompanyNameFieldController.text != "" &&
        userExperienceUpdateSelectedJobLocation != "") {
      userExperienceList[updateItemIndex] = UserExperienceModel(
          designation: userExperienceUpdateDesignFieldController.text,
          companyName: userExperienceUpdateCompanyNameFieldController.text,
          location: userExperienceUpdateSelectedJobLocation!,
          duration: userExperienceUpdateDurationFieldController.text);
      userExperienceUpdateDesignFieldController.clear();
      userExperienceUpdateCompanyNameFieldController.clear();
      userExperienceUpdateSearchJobLocationFieldController.clear();
      userExperienceUpdateSelectedJobLocation =null;
      userExperienceUpdateDurationFieldController.clear();
    }
    notifyListeners();
    selectedUserExperienceListIndex = -1;
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



  userExperienceAddButton() {
    // print(" add Button $userExperienceAddSelectedJobLocation");
    // print(" add designation $userExperienceAddDesignFieldController");
    // print(" add company name $userExperienceAddCompanyNameFieldController");

    if (userExperienceAddDesignFieldController.text != "" &&
        userExperienceAddCompanyNameFieldController.text != "" &&
        userExperienceAddSelectedJobLocation != "") {
      userExperienceList.add(UserExperienceModel(
          designation: userExperienceAddDesignFieldController.text,
          companyName: userExperienceAddCompanyNameFieldController.text,
          location: userExperienceAddSelectedJobLocation!,
          duration: userExperienceAddDurationFieldController.text));

      userExperienceAddDesignFieldController.clear();
      userExperienceAddSearchJobLocationFieldController.clear();
      userExperienceAddDurationFieldController.clear();
      userExperienceAddSelectedJobLocation = null;
      userExperienceAddCompanyNameFieldController.clear();
      isExperienceAddShow = false;
    }

    notifyListeners();
  }

  experienceOkButton() {
    isDialogShow = false;
    isExperienceAddShow = false;
    selectedUserExperienceListIndex = -1;
    if (userExperienceList.isNotEmpty) {
      isExperienceExpanded = true;
    } else {
      isExperienceExpanded = false;
    }
    notifyListeners();
  }

  /// ------ User Experience ----////


  /// ------ User Current Position ----////

  final userCurrentPosDesignFieldController = TextEditingController();
  final userCurrentPosCompanyNameFieldController = TextEditingController();
  final userCurrentPosSearchJobLocationController = TextEditingController();

  String? userCurrentPosSelectedJobLocation;
  updateUserCurrentPosSearchJobLocationController(String? value) {
    userCurrentPosSelectedJobLocation = value;
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
    print(workingModeList[index]);
    notifyListeners();
  }
  /// ------ User Current Position ----////

  /// ------ User Qualification ------- ///


  final qualificationSearchController = TextEditingController();
  String? selectedQualification;
  updateSelectedQualification(String? value) {
    selectedQualification = value;
    notifyListeners();
  }


/// ------ User Qualification ------- ///

}



class UserExperienceModel {
  final String designation;
  final String companyName;
  final String location;
  final String? duration;

  UserExperienceModel(
      {required this.designation,
      required this.companyName,
      required this.location,
      this.duration});
}
