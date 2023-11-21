import 'dart:io';

import 'package:emploiflutter/ui/profile/helper/user_about_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_details_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_experience_dialogbox/user_experience_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_qualification_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_resume_dialogbox.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';

final profileController = ChangeNotifierProvider((ref) => ProfileController());

class ProfileController extends ChangeNotifier {
  bool isDialogShow = false;
  int dialogValue = 0;

  updateIsDialogShow() {
    isDialogShow = !isDialogShow;
    notifyListeners();
  }

  setDialogValue(int value) {
    dialogValue = value;
    notifyListeners();
  }

  ///---------------- Show dialog according to its value --------------///
  dialogForShow() {
    if (dialogValue == 0) {
      return const UserDetailsDialogBox();
    } else if (dialogValue == 1) {
      return const UserAboutDialogBox();
    } else if (dialogValue == 2) {
      return const UserQualificationDialogBox();
    } else if (dialogValue == 3) {
      return const UserExperienceDialogBox();
    } else if (dialogValue == 4) {
      return const UserResumeDialogBox();
    }
    notifyListeners();
  }

  ///---------------- Show dialog according to its value --------------///

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

  final userExperienceDesignFieldController = TextEditingController();
  final userExperienceCompanyNameFieldController = TextEditingController();
  final userExperienceJobLocationFieldController = TextEditingController();
  final userExperienceDurationFieldController = TextEditingController();

  List<UserExperienceModel> userExperienceList = [];
  int selectedUserExperienceListIndex = -1;
  int updateItemIndex = 0;

  updateListItem() {
    if (userExperienceDesignFieldController.text != "" &&
        userExperienceJobLocationFieldController.text != "" &&
        userExperienceCompanyNameFieldController.text != "") {
      userExperienceList[updateItemIndex] = UserExperienceModel(
          designation: userExperienceDesignFieldController.text,
          companyName: userExperienceCompanyNameFieldController.text,
          location: userExperienceJobLocationFieldController.text,
          duration: userExperienceDurationFieldController.text);
      userExperienceDesignFieldController.clear();
      userExperienceJobLocationFieldController.clear();
      userExperienceDurationFieldController.clear();
      userExperienceCompanyNameFieldController.clear();
    }
    notifyListeners();
    selectedUserExperienceListIndex = -1;
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
      userExperienceDesignFieldController.text = designation;
      userExperienceCompanyNameFieldController.text = companyName;
      userExperienceJobLocationFieldController.text = jobLocation;
      userExperienceDurationFieldController.text = duration ?? "";
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
    if (userExperienceDesignFieldController.text != "" &&
        userExperienceJobLocationFieldController.text != "" &&
        userExperienceCompanyNameFieldController.text != "") {
      userExperienceList.add(UserExperienceModel(
          designation: userExperienceDesignFieldController.text,
          companyName: userExperienceCompanyNameFieldController.text,
          location: userExperienceJobLocationFieldController.text,
          duration: userExperienceDurationFieldController.text));
      userExperienceDesignFieldController.clear();
      userExperienceJobLocationFieldController.clear();
      userExperienceDurationFieldController.clear();
      userExperienceCompanyNameFieldController.clear();
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
