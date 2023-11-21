import 'dart:io';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:file_picker/file_picker.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final registerProfileDetailsController = ChangeNotifierProvider((ref) => RegisterProfileDetailsController());

class RegisterProfileDetailsController extends ChangeNotifier{

  PageController pageController = PageController();

  int index= 0;

  forwardBtn(BuildContext context){
    if(index < 3) {
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




  ///-----------------Profile1--------------///
  final bioController = TextEditingController();
  List<String> qualificationList=[
    "BCA",
    "B.Com",
    "B.A.",
    "M.A.",
    "Bsc.IT"
  ];

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

  String? qualification;
  updateSelectedQualification(String? value) {
    qualification = value;
    notifyListeners();
  }
  ///-----------------Profile1--------------///


  ///-----------------Profile2--------------///
  List<String> jobTitleList=[
    "Flutter dev",
    "Full Stack dev",
    "React native",
    "Human Resource",
    "Accountant",
    "Freelancing",
  ];

  List<String> preferCityList=[
    "Ahmedabad",
    "Delhi",
    "Mumbai",
    "Hyderabad",
    "Bangalore",
  ];
  String? jobTitle;
  updateSelectedJobTitle(String? value) {
    jobTitle = value;
    notifyListeners();
  }

  String? preferCity;
  updateSelectedPreferCity(String? value) {
    preferCity = value;
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


  ///---Lottie Controller ---///
      late AnimationController resumeLottieController;
      late AnimationController uploadImgLottieController;

      initializeLottie(TickerProvider vsync1,TickerProvider vsync2)async{
         resumeLottieController = AnimationController(vsync: vsync1,duration: const Duration(seconds: 2));
        uploadImgLottieController = AnimationController(vsync: vsync2,duration: const Duration(seconds: 2));
      }
  ///---Lottie Controller ---///

  ///-----------------Profile2--------------///


  ///-----------------Profile2.0--------------///

  final companyNameController = TextEditingController();

  List<String> designationList=[
    "Flutter dev",
    "Full Stack dev",
    "React native",
    "Human Resource",
    "Accountant",
    "Freelancing",
  ];

  List<String> jobLocationList=[
    "Ahmedabad",
    "Delhi",
    "Mumbai",
    "Hyderabad",
    "Bangalore",
  ];
  String? designation;
  updateSelectedDesignation(String? value) {
    designation = value;
    notifyListeners();
  }

  String? jobLocation;
  updateSelectedJobLocation(String? value) {
    jobLocation = value;
    notifyListeners();
  }
  ///-----------------Profile2.0--------------///




  ///-----------------Profile3--------------///

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

  ///-----------------Profile3--------------///

  ///-----------------Profile4--------------///

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

  ///-----------------Profile4--------------/  //

  @override
  void notifyListeners() {
    super.notifyListeners();
  }


}


