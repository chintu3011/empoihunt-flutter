import 'dart:io';
import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_singleton.dart';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';

final jobSeekerRegisterProfileDetailsController = ChangeNotifierProvider((ref) => JobSeekerRegisterProfileDetailsController(ref));

class JobSeekerRegisterProfileDetailsController extends ChangeNotifier{
  Ref ref;
  JobSeekerRegisterProfileDetailsController(this.ref);

  final GlobalKey<FormState> registerProfileDetailsGlobalKey = GlobalKey();

  PageController pageController = PageController();

  int index= 0;

  forwardBtn(BuildContext context){
    if(isExperienced){
      if(index <= 4) {
        if(index< 4){
          index++;
        }
        pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
        Curves.easeIn);
      }else{
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
      }
    }else if(isFresher){
      if(index <= 3) {
        print(index);
        print("final");
        if(index<3){
          index++;
        }
        pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
        Curves.easeIn);
      }else{
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
      }
    }
    notifyListeners();
  }

  backwardBtn(){
    if(index>0){
      index--;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
      Curves.easeIn);
    }
    notifyListeners();
  }
  ///---Lottie Controller ---///
  late AnimationController resumeLottieController;
  late AnimationController uploadImgLottieController;

  initializeLottie(TickerProvider vsync1,TickerProvider vsync2)async{
    resumeLottieController = AnimationController(vsync: vsync1,duration: const Duration(seconds: 2));
    uploadImgLottieController = AnimationController(vsync: vsync2,duration: const Duration(seconds: 2));
  }
  ///---Lottie Controller ---///


  ///-----------------Profile1--------------///
  final bioController = TextEditingController();

  final qualificationSearchController = TextEditingController();
  bool isQualificationEmpty = false;



  bool isBioControllerEmpty = false;
  updateIsBioEmpty(String? value){
    if(value !=null){
      isBioControllerEmpty = false;
    }else{
      isBioControllerEmpty = true;
    }
    notifyListeners();
  }


  bool isFresher = true;
  updateFresher(){
    isFresher = true;
    isExperienced=false;
    notifyListeners();
  }
  bool isExperienced = false;
  updateExperienced(){
    isExperienced = true;
    isFresher=false;
    notifyListeners();
  }

  String? selectedQualification;
  bool isSelectedQualificationEmpty =false;
  updateSelectedQualification(String? value) {
      selectedQualification = value;
      isSelectedQualificationEmpty = false;
    notifyListeners();
  }
  ///-----------------Profile1--------------///


  ///-----------------Profile2--------------///


  final jobSearchController = TextEditingController();
  final preferCitySearchController = TextEditingController();


  bool isSelectedJobTitleEmt = false;
  bool isSelectedPrefCityEmt = false;
  String? selectedJobTitle;
  updateSelectedJobTitle(String? value) {
    selectedJobTitle = value;
    isSelectedJobTitleEmt = false;
    notifyListeners();
  }

  String? selectedPreferCity;
  updateSelectedPreferCity(String? value) {
    selectedPreferCity = value;
    isSelectedPrefCityEmt = false;
    notifyListeners();
  }


  List<String> workingModeList=[
    "On-Site",
    "Remote",
    "Hybrid",
  ];

  setValueOfWorkingMode(String site){
    if(site == "On-Site"){
      selectedWorkingMode=0;
    }else if(site == "Remote"){
      selectedWorkingMode=1;
    }else if(site == "Hybrid"){
      selectedWorkingMode=2;
    }
    notifyListeners();
  }

  int selectedWorkingMode = 0;
  String selectedWorkingText = "On-Site";

  updateWorkingMode(int index){
    selectedWorkingMode = index;
    debugPrint(workingModeList[index]);
    selectedWorkingText = workingModeList[index];
    notifyListeners();
  }

  ///-----------------Profile2--------------///


  ///-----------------Profile3--------------///

  final companyNameController = TextEditingController();
  final designationSearchController = TextEditingController();
  final jobLocationSearchController = TextEditingController();

  final expertiseController = TextEditingController();
  List<String> expertiseList = [];


  removeDataInExpertiseList(int index){
    expertiseList.removeAt(index);
    notifyListeners();
  }
  addExpertise() {
    if (expertiseController.text != "") {
      expertiseList.add(expertiseController.text);
      expertiseController.clear();
      isExpertiseEmpty = false;
    }else{
      isExpertiseEmpty = true;
    }
    notifyListeners();
  }
  String? expertiseTagline;

  expertiseToTagline(){
    expertiseTagline = "";
    expertiseTagline = expertiseList.join(" || ");
    notifyListeners();
  }


  bool isCompanyNameEmpty = false;
  bool isSelectedDesignEmpty = false;
  bool isSelectedJobLocEmpty = false;
  bool isExpertiseEmpty = false;

  String? selectedDesignation;

  updateIsCompanyNameEmt(String? value){
    if(value !=null){
      isCompanyNameEmpty = false;
    }else{
      isCompanyNameEmpty = true;
    }
    notifyListeners();
  }
  updateSelectedDesignation(String? value) {
    selectedDesignation = value;
    isSelectedDesignEmpty = false;
    notifyListeners();
  }

  String? selectedJobLocation;
  updateSelectedJobLocation(String? value) {
    selectedJobLocation = value;
    isSelectedJobLocEmpty = false;
    notifyListeners();
  }
  ///-----------------Profile3--------------///




  ///-----------------Profile4--------------///

  String? pdfUrl;
  String? pdfName;
  Future<void> pickPdfFile() async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
     );
    resumeLottieController.stop();
    if(result != null){
      final PlatformFile file = result.files.first;
      pdfName = file.name;
      pdfUrl = file.path;
      // print(file.name);
      // print(file.path);
     resumeLottieController.reset();
      resumeLottieController.forward();
    }else{
      resumeLottieController.stop();
    }
    notifyListeners();
  }

  ///-----------------Profile4--------------///

  ///-----------------Profile5--------------///

  bool isPicAnimationRun = false;
  String? imgUrl;
  File? profilePic;
  String profilePicName = "";

  Future<void> imagePicker() async{
    isPicAnimationRun = true;
        final result = await FilePicker.platform.pickFiles(
          type: FileType.image,);
        profilePic = null;
        notifyListeners();
        uploadImgLottieController.stop();
        if(result != null){
          final PlatformFile file = result.files.first;
          // print("image name --->${file.name}");
          uploadImgLottieController.reset();
          uploadImgLottieController.forward();
          await Future.delayed(const Duration(seconds: 3),);
          profilePic = File(file.path!);
          imgUrl = file.path;
          profilePicName = file.name;
          isPicAnimationRun=false;
          notifyListeners();
        }else{
          uploadImgLottieController.stop();
          isPicAnimationRun=false;
          notifyListeners();
        }
        notifyListeners();
  }

  ///-----------------Profile5--------------///


  ///---------------- register Submit button -----------------///

  experienceRegisterSubmitButton(BuildContext context)async{
    print("experienceRegisterSubmitButton");
    if(bioController.text != ""){
      isBioControllerEmpty = false;
      if(selectedQualification != null){
        isQualificationEmpty = false;
        if(companyNameController.text != ""){
          isCompanyNameEmpty = false;
          if(selectedDesignation !=null){
            isSelectedDesignEmpty = false;
            if(selectedJobLocation != null){
              isSelectedJobLocEmpty = false;
              if(selectedJobTitle != null){
                isSelectedJobTitleEmt = false;
                if(selectedPreferCity !=null){
                  isSelectedPrefCityEmt = false;
                  if(expertiseList.isNotEmpty){
                      isExpertiseEmpty = false;
                    if(pdfName !=null){
                      if(profilePic !=null){
                        await registerApiCall(context);
                      }else{
                        showSnackBar(context: context, error: "Please Select the image");
                      }
                    }else{
                      index = 3;
                      pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
                      Curves.easeIn);
                      showSnackBar(context: context, error: "Please Select Resume");
                    }
                  }else{
                    isExpertiseEmpty = true;
                    index =2;
                    pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
                    Curves.easeIn);
                  }
                }else{
                  isSelectedPrefCityEmt = true;
                  index =2;
                  pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
                  Curves.easeIn);
                }
              }else{
                isSelectedJobTitleEmt = true;
                index =2;
                pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
                Curves.easeIn);
              }
            }else{
              index = 1;
              isSelectedJobLocEmpty = true;
              pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
              Curves.easeIn);
            }
          }else{
            index = 1;
            isSelectedDesignEmpty = true;
            pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
            Curves.easeIn);
          }
        }else{
          isCompanyNameEmpty =true;
          index =1;
          pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
          Curves.easeIn);
        }
      }else{
        isQualificationEmpty = true;
        index =0;
        pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
        Curves.easeIn);
      }
    }else{
      isBioControllerEmpty = true;
      index =0;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
      Curves.easeIn);
    }
    notifyListeners();
  }

  freshersRegisterSubmitButton(BuildContext context)async{
    print("freshersRegisterSubmitButton");
    if(bioController.text != ""){
      isBioControllerEmpty = false;
      if(selectedQualification != null){
        isQualificationEmpty = false;
        if(selectedJobTitle != null){
          isSelectedJobTitleEmt = false;
          if(selectedPreferCity !=null){
            isSelectedPrefCityEmt = false;
            if(expertiseList.isNotEmpty){
              isExpertiseEmpty = false;
              if(pdfName !=null){
                if(profilePic !=null){
                  await registerApiCall(context);
                }else{
                  showSnackBar(context: context, error: "Please Select the image");
                }
              }else{
                index = 2;
                pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
                Curves.easeIn);
                showSnackBar(context: context, error: "Please Select Resume");
              }
            }else{
              isExpertiseEmpty = true;
              index =1;
              pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
              Curves.easeIn);
            }
          }else{
            isSelectedPrefCityEmt = true;
            index =1;
            pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
            Curves.easeIn);
          }
        }else{
          isSelectedJobTitleEmt = true;
          index =1;
          pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
          Curves.easeIn);
        }
     }else{
       isQualificationEmpty = true;
       index =0;
       pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
       Curves.easeIn);
     }
    }else{
      isBioControllerEmpty = true;
      index =0;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
      Curves.easeIn);
    }
    notifyListeners();
  }


  ///---------------- register Submit button -----------------///


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



  double latitude = 0.0;
  double longitude = 0.0;

  Future getLocation() async{
   if(await Permission.location.isGranted){
     Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     latitude = position.latitude;
     longitude = position.longitude;
     notifyListeners();
   }else{
     var status = await Permission.location.request();
     if(status.isGranted){
       Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
       latitude = position.latitude;
       longitude = position.longitude;
     }
   }
  }

  Future registerApiCall(BuildContext context) async {
    isLoading = true;
    final uid = FireBaseSingleton.instance.firebaseAuth.currentUser!.uid;
    final deviceData =
    BoxService.boxService.nativeDeviceBox.get(deviceDetailKey)!;
    print("FCM Token------->${SharedPrefServices.services.getString(fcmTokenKey)}");
    notifyListeners();
    print(uid);
    expertiseToTagline();
    await getLocation();
    try {
      FormData formData = FormData.fromMap({
        "profilePic": await MultipartFile.fromFile(imgUrl!, filename: profilePicName),
        "resume":await MultipartFile.fromFile(pdfUrl!, filename: pdfName),
      });
      int userDeletedValue  = ref.read(registerController).userDeleted;
      Response response = await DioClient.client.postDataWithForm(
          "${APIEndPoint.registerUserApi}?iRole=0&vFirebaseId=$uid&vMobile=%2B$phoneNumber&vDeviceId=${deviceData.deviceId}&vDeviceType=${deviceData.deviceType}&vOSVersion=${deviceData.deviceVersion}&tDeviceToken=$fcmTokenKey&tDeviceName=${deviceData.deviceName}&vFirstName=$firstName&vLastName=$lastName&vEmail=$email&tBio=${bioController.text}&vCity=$city&vCurrentCompany=${companyNameController.text}&vDesignation=${selectedDesignation??""}&vJobLocation=${selectedJobLocation??""}&vDuration=""&vPreferCity=${selectedPreferCity??""}&vPreferJobTitle=${selectedJobTitle??""}&vQualification=${selectedQualification??""}&vWorkingMode=${isFresher? selectedWorkingText :""}&tTagLine=${expertiseTagline??""}&tLatitude=${latitude}&tLongitude=${longitude}&tAppVersion=0&isDeleted=$userDeletedValue",
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
        clearData();
        debugPrint("Successfully register");
      }
    } catch (e) {
      isLoading = false;
      Future.error(e);
    }
    notifyListeners();
  }
  @override
  void notifyListeners() {
    super.notifyListeners();
  }


  clearData(){
    companyNameController.clear();
    jobSearchController.clear();
    preferCitySearchController.clear();
    designationSearchController.clear();
    qualificationSearchController.clear();
    jobLocationSearchController.clear();
    selectedQualification = null;
    selectedDesignation = null;
    selectedJobLocation = null;
    pdfUrl = null;
    imgUrl = null;
    profilePic = null;
    pdfName = null;
    selectedWorkingMode = 0;
    isFresher = true;
    expertiseList = [];
    expertiseTagline = null;
    latitude = 0.0;
    longitude = 0.0;
    phoneNumber = "";
    email = "";
    profilePicName = "";
    lastName = "";
    firstName = "";
    city = "";
    notifyListeners();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    companyNameController.dispose();
    jobSearchController.dispose();
    designationSearchController.dispose();
    qualificationSearchController.dispose();
    super.dispose();
  }

}




