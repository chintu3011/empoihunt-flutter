import 'dart:io';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../repository/api_end_point.dart';
import '../../../repository/dio_client.dart';

final jobSeekerRegisterProfileDetailsController = ChangeNotifierProvider((ref) => JobSeekerRegisterProfileDetailsController());

class JobSeekerRegisterProfileDetailsController extends ChangeNotifier{

  final GlobalKey<FormState> registerProfileDetailsGlobalKey = GlobalKey();

  PageController pageController = PageController();

  int index= 0;

  forwardBtn(BuildContext context){
    if(isExperienced){
      if(index < 4) {
        index++;
        pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
        Curves.easeIn);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
      }
    }else if(isFresher){
      if(index < 3) {
        index++;
        pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
        Curves.easeIn);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
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


  bool isFresher = false;
  updateFresher(){
    isFresher = true;
    isExperienced=false;
    notifyListeners();
  }
  bool isExperienced = true;
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

  bool isOnSite = false;
  bool isRemote = false;
  bool isHybrid = true;
  updateOnSite(){
    isOnSite = true;
    isRemote= false;
    isHybrid= false;
    notifyListeners();
  }
  updateRemote(){
    isRemote = true;
    isOnSite=false;
    isHybrid = false;
    notifyListeners();
  }
  updateHybrid(){
    isHybrid = true;
    isRemote = false;
    isOnSite=false;
    notifyListeners();
  }

  ///-----------------Profile2--------------///


  ///-----------------Profile3--------------///

  final companyNameController = TextEditingController();
  final designationSearchController = TextEditingController();
  final jobLocationSearchController = TextEditingController();

  bool isCompanyNameEmpty = false;
  bool isSelectedDesignEmpty = false;
  bool isSelectedJobLocEmpty = false;
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

  String? fileName;
  File? pdfFile;
  Future<void> pickPdfFile() async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
     );
    resumeLottieController.stop();
    if(result != null){
      final PlatformFile file = result.files.first;
      fileName = file.name;
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
  File? profilePic;
  Future<void> imagePicker() async{
    isPicAnimationRun = true;
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg','png','jpeg']
        );
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

  experienceRegisterSubmitButton(BuildContext context){
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
                  if(fileName !=null){
                    if(profilePic !=null){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
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

  freshersRegisterSubmitButton(BuildContext context){
    if(bioController.text != ""){
      isBioControllerEmpty = false;
      if(selectedQualification != null){
        isQualificationEmpty = false;
        if(selectedJobTitle != null){
          isSelectedJobTitleEmt = false;
          if(selectedPreferCity !=null){
            isSelectedPrefCityEmt = false;
            if(fileName !=null){
              if(profilePic !=null){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
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

  registerApiCall(){
    try{
      // DioClient.client.postData(APIEndPoint.registerUserApi,
      //     {
      //       "iRole":1,
      //       "vFirebaseId":"required",
      //       "vMobile":"required",
      //       "vDeviceId":"",
      //       "vDeviceType":"",
      //       "vOSVersion":"",
      //       "tDeviceToken":"",
      //       "tDeviceName":"",
      //       "vFirstName":"",
      //       "vLastName":"",
      //       "vEmail":"",
      //       "tBio":"",
      //       "vCity":"",
      //       "vCurrentCompany":"",
      //       "vDesignation":"",
      //       "vJobLocation":"",
      //       "vDuration":"",
      //       "vPreferCity":"",
      //       "vPreferJobTitle":"",
      //       "vQualification":"",
      //       "vWorkingMode":"",
      //       "tTagLine":"",
      //       "fbid":"",
      //       "googleid":"",
      //       "tLatitude":"",
      //       "tLongitude":"",
      //       "tAppVersion":""
      //
      //     });
    }catch (e){
      Future.error(e);
    }
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
    jobSearchController.dispose();
    designationSearchController.dispose();
    qualificationSearchController.dispose();
    super.dispose();
  }

}




