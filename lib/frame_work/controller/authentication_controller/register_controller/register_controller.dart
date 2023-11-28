import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/authentication/register/register_otp.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:page_transition/page_transition.dart';

final registerController = ChangeNotifierProvider((ref) => RegisterController());

class RegisterController extends ChangeNotifier{

  final GlobalKey<FormState> registerKey = GlobalKey();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();


  bool isCheck = false;
  updateIsCheck(bool val){
    isCheck = val;
    notifyListeners();
  }

  // List<String> cities=[
  //   "Ahmedabad",
  //   "Kolkata",
  //   "Hyderabad",
  //   "Delhi",
  //   "Bangalore",
  //   "Surat",
  // ];

  registerButton(BuildContext context){
    if(registerKey.currentState!.validate()){
      if(cityController.text !=""){
        if(isCheck){
          Navigator.push(context, PageTransition(child: const RegisterOTP(), type: PageTransitionType.rightToLeft,duration: const Duration(milliseconds: 300)));
          clearForms();
        }else{
          showSnackBar(context: context, error: "Please Select Terms & Condition");
        }
      }else{
        showSnackBar(context: context, error: "Please select city");
      }
    }
    notifyListeners();
  }

  clearForms(){
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    cityController.clear();
    notifyListeners();
  }
  ///------------- get location List from the Shared Preference -----------////
  ///------------- btw i called api on authIntro screen and Stored in share preference -----///
  List<String> checkCity(String query){
    query = query.toUpperCase().trim();
    return SharedPrefServices.services.getList(locationKey)!.where((city) => city.toUpperCase().trim().contains(query)).toList();
  }


}