import 'dart:io';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final recruiterRegisterProfileDetailsController = ChangeNotifierProvider((ref) => RecruiterRegisterProfileDetailsController());

class RecruiterRegisterProfileDetailsController extends ChangeNotifier{

  final GlobalKey<FormState> registerProfileDetailsGlobalKey = GlobalKey();

  PageController pageController = PageController();

  int index= 0;

  forwardBtn(BuildContext context){
    if(index < 2) {
      index++;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
      Curves.easeIn);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
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
  late AnimationController uploadImgLottieController;

  ///---Lottie Controller ---///


  ///-----------------Profile1--------------///
  final bioController = TextEditingController();

  final qualificationSearchController = TextEditingController();
  bool isQualificationEmpty = false;


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
  updateSelectedQualification(String? value) {
    selectedQualification = value;
    notifyListeners();
  }
  ///-----------------Profile1--------------///


  ///-----------------Profile2--------------///

  final companyNameController = TextEditingController();
  final designationSearchController = TextEditingController();
  final jobLocationSearchController = TextEditingController();

  String? selectedDesignation;
  updateSelectedDesignation(String? value) {
    selectedDesignation = value;
    notifyListeners();
  }

  String? selectedJobLocation;
  updateSelectedJobLocation(String? value) {
    selectedJobLocation = value;
    notifyListeners();
  }
  ///-----------------Profile3--------------///


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




