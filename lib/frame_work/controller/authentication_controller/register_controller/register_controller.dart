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

  List<String> cities=[
    "Ahmedabad",
    "Kolkata",
    "Hyderabad",
    "Delhi",
    "Bangalore",
    "Surat",
  ];



  List<String> checkCity(String query){
    query = query.toUpperCase();
    return cities.where((city) => city.toUpperCase().contains(query)).toList();
  }


}