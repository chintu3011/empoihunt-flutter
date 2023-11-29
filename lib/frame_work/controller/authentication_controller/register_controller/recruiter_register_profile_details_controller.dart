import 'dart:io';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final recruiterRegisterProfileDetailsController = ChangeNotifierProvider((ref) => RecruiterRegisterProfileDetailsController());

class RecruiterRegisterProfileDetailsController extends ChangeNotifier{

  final GlobalKey<FormState> registerProfileDetailsGlobalKey = GlobalKey();

  PageController pageController = PageController();

  int index= 0;

  forwardBtn(BuildContext context){
    if(index <2) {
      index++;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
      Curves.easeIn);
    }else {
      registerSubmitButton(context);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
    }
    print(index);
    notifyListeners();
  }

  backwardBtn(){
    if(index>0){
      index--;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
      Curves.easeIn);
    }
    notifyListeners();
  }

  registerSubmitButton(BuildContext context){
    print("final button called");
    if(registerProfileDetailsGlobalKey.currentState!.validate()){
      if(selectedQualification!=null && bioController.text != ""){
        isQualificationEmpty = false;
        if(companyNameController.text !="" && selectedDesignation !=null && selectedJobLocation != null){
          isDesignationEmpty = false;
          isJobLocationEmpty = false;
          if(profilePic != null){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
          }else{
            showSnackBar(context: context, error: "Please select an image");
          }
        }else{
          isDesignationEmpty = true;
          isJobLocationEmpty = true;
          isCompanyEmpty = true;
          index =1;
          pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
          Curves.easeIn);
        }
      }else{
        isQualificationEmpty = true;
        isBioEmpty = true;
        index = 0;
        pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve:
        Curves.easeIn);
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


  updateIsBioEmpty(String value){
    if(value !=""){
      isBioEmpty = false;
    }else{
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

  updateIsCompanyEmpty(String value){
    if(value !=""){
      isCompanyEmpty = false;
    }else{
      isCompanyEmpty = true;
    }
    notifyListeners();
  }

  String? selectedDesignation;
  updateSelectedDesignation(String? value) {
    selectedDesignation = value;
    isDesignationEmpty =false;
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

  ///-----------------Profile3--------------///

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




