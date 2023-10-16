import 'package:emploiflutter/ui/utils/theme/theme.dart';

final registerController = ChangeNotifierProvider((ref) => RegisterController());

class RegisterController extends ChangeNotifier{

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
}