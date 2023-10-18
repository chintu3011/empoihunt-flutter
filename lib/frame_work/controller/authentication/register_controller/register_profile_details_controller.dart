import 'package:emploiflutter/ui/utils/theme/theme.dart';

final registerProfileDetailsController = ChangeNotifierProvider((ref) => RegisterProfileDetailsController());

class RegisterProfileDetailsController extends ChangeNotifier{

  PageController pageController = PageController();

  int index= 0;

  forwardBtn(){
    if(index != 4) {
      index++;
      pageController.animateToPage(index,duration: const Duration(milliseconds: 400), curve:
      Curves.easeIn);
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



  ///-----------------Profile2--------------///
  @override
  void notifyListeners() {
    super.notifyListeners();
  }

}


