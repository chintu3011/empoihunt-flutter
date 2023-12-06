import 'dart:io';
import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_singleton.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:page_transition/page_transition.dart';

import '../../../repository/model/user_model/user_detail_data_model.dart';

final recruiterRegisterProfileDetailsController = ChangeNotifierProvider(
    (ref) => RecruiterRegisterProfileDetailsController(ref));

class RecruiterRegisterProfileDetailsController extends ChangeNotifier {
  final Ref ref;

  RecruiterRegisterProfileDetailsController(this.ref);

  final GlobalKey<FormState> registerProfileDetailsGlobalKey = GlobalKey();

  PageController pageController = PageController();

  int index = 0;

  forwardBtn(BuildContext context) {
    if (index < 2) {
      index++;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      registerSubmitButton(context);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
    }
    // print(index);
    notifyListeners();
  }

  backwardBtn() {
    if (index > 0) {
      index--;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    notifyListeners();
  }

  registerSubmitButton(BuildContext context) async {
    debugPrint("final button called");
    if (registerProfileDetailsGlobalKey.currentState!.validate()) {
      if (selectedQualification != null && bioController.text != "") {
        isQualificationEmpty = false;
        if (companyNameController.text != "" &&
            selectedDesignation != null &&
            selectedJobLocation != null) {
          isDesignationEmpty = false;
          isJobLocationEmpty = false;
          if (profilePic != null) {
            await registerApiCall(context);
          } else {
            showSnackBar(context: context, error: "Please select an image");
          }
        } else {
          isDesignationEmpty = true;
          isJobLocationEmpty = true;
          isCompanyEmpty = true;
          index = 1;
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      } else {
        isQualificationEmpty = true;
        isBioEmpty = true;
        index = 0;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    }
    notifyListeners();
  }

  ///---Lottie Controller ---///
  late AnimationController uploadImgLottieController;

  ///---Lottie Controller ---///

  ///-----------------Profile1--------------///
  final bioController = TextEditingController();
  bool isBioEmpty = false;
  final qualificationSearchController = TextEditingController();
  bool isQualificationEmpty = false;

  updateIsBioEmpty(String value) {
    if (value != "") {
      isBioEmpty = false;
    } else {
      isBioEmpty = true;
    }
    notifyListeners();
  }

  String? selectedQualification;

  updateSelectedQualification(String? value) {
    selectedQualification = value;
    isQualificationEmpty = false;
    notifyListeners();
  }

  ///-----------------Profile1--------------///

  ///-----------------Profile2--------------///

  final companyNameController = TextEditingController();
  final designationSearchController = TextEditingController();
  final jobLocationSearchController = TextEditingController();
  bool isCompanyEmpty = false;
  bool isDesignationEmpty = false;
  bool isJobLocationEmpty = false;

  updateIsCompanyEmpty(String value) {
    if (value != "") {
      isCompanyEmpty = false;
    } else {
      isCompanyEmpty = true;
    }
    notifyListeners();
  }

  String? selectedDesignation;

  updateSelectedDesignation(String? value) {
    selectedDesignation = value;
    isDesignationEmpty = false;
    notifyListeners();
  }

  String? selectedJobLocation;

  updateSelectedJobLocation(String? value) {
    selectedJobLocation = value;
    isJobLocationEmpty = false;
    notifyListeners();
  }

  ///-----------------Profile2--------------///

  ///-----------------Profile3--------------///

  bool isPicAnimationRun = false;
  String? imgUrl;
  File? profilePic;
  String profilePicName = "";

  Future<void> imagePicker() async {
    isPicAnimationRun = true;
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'png', 'jpeg']);
    profilePic = null;
    notifyListeners();
    uploadImgLottieController.stop();
    if (result != null) {
      final PlatformFile file = result.files.first;
      // print("image name --->${file.name}");
      uploadImgLottieController.reset();
      uploadImgLottieController.forward();
      await Future.delayed(
        const Duration(seconds: 3),
      );
      profilePic = File(file.path!);
      imgUrl = file.path;
      profilePicName = file.name;
      isPicAnimationRun = false;
      notifyListeners();
    } else {
      uploadImgLottieController.stop();
      isPicAnimationRun = false;
      notifyListeners();
    }
    notifyListeners();
  }

  ///-----------------Profile3--------------///

  ///----------------- Register Api ----------------------////
  String phoneNumber = "";
  String email = "";
  String lastName = "";
  String firstName = "";
  String city = "";

  assignRegisterData(
      {required String phone,
      required String firstName,
      required String lastName,
      required String city,
      required String email}) {
    phoneNumber = phone;
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.city = city;
    notifyListeners();
  }

  bool isLoading = false;

  Future registerApiCall(BuildContext context) async {
    isLoading = true;
    final uid = FireBaseSingleton.instance.firebaseAuth.currentUser!.uid;
    final deviceData =
        BoxService.boxService.nativeDeviceBox.get(deviceDetailKey)!;
    print(
        "FCM Token------->${SharedPrefServices.services.getString(fcmTokenKey)}");
    print(uid);
    try {
      FormData formData = FormData.fromMap({
        "profilePic": await MultipartFile.fromFile(imgUrl!, filename: profilePicName),
        "resume":"",
      });
      Response response = await DioClient.client.postDataWithForm(
          "${APIEndPoint.registerUserApi}?iRole=1&vFirebaseId=$uid&vMobile=%2B$phoneNumber&vDeviceId=${deviceData.deviceId}&vDeviceType=0&vOSVersion=${deviceData.deviceVersion}&tDeviceToken=$fcmTokenKey&tDeviceName=${deviceData.deviceName}&vFirstName=$firstName&vLastName=$lastName&vEmail=$email&tBio=${bioController.text}&vCity=$city&vCurrentCompany=${companyNameController.text}&vDesignation=$selectedDesignation&vJobLocation=$selectedJobLocation&vDuration=""&vPreferCity=""&vPreferJobTitle=""&vQualification=$selectedQualification&tTagLine=""&tLatitude=""&tLongitude=""&tAppVersion=0",
          formData: formData);
      if (response.statusCode == 200) {
        isLoading = false;
        UserDetailDataModel user = UserDetailDataModel.fromJson(response.data["data"]);
        BoxService.boxService.addUserDetailToHive(userDetailKey, UserDetailDataModel(tAuthToken: user.tAuthToken, iUserId: user.iUserId, tDeviceToken: user.tDeviceToken, user: user.user));
        await SharedPrefServices.services.setBool(isUserLoggedIn, true);
        if(context.mounted){
          Navigator.pushAndRemoveUntil(context, PageTransition(
              child: const DashBoard(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300)), (route) => false);
        }
        print("Succesfully register");
      }
    } catch (e) {
      isLoading = false;
      Future.error(e);
    }
    notifyListeners();
  }

  ///----------------- Register Api ----------------------////

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    companyNameController.dispose();
    designationSearchController.dispose();
    qualificationSearchController.dispose();
    super.dispose();
  }
}
