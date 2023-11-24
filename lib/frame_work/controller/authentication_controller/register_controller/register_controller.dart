import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

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

  ///------------- get location List from the Shared Preference -----------////
  ///------------- btw i called api on authIntro screen and Stored in share preference -----///
  List<String> checkCity(String query){
    query = query.toUpperCase().trim();
    return SharedPrefServices.services.getList(locationKey)!.where((city) => city.toUpperCase().trim().contains(query)).toList();
  }


}