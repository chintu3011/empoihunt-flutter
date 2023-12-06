import 'package:emploiflutter/ui/utils/theme/theme.dart';

final chooseUserRoleController = ChangeNotifierProvider((ref) => ChooseUserRoleController());

class ChooseUserRoleController extends ChangeNotifier{

  int userRole = 0;
  updateSelectedUserType(int role){
    userRole = role;
    debugPrint("UserRole-->>>>> $userRole");
    notifyListeners();
  }

}