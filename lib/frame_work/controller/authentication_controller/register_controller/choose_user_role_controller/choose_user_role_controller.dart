import 'package:emploiflutter/ui/utils/theme/theme.dart';

final chooseUserRoleController = ChangeNotifierProvider((ref) => ChooseUserRoleController());

class ChooseUserRoleController extends ChangeNotifier{

  int? selectedUserType;
  updateSelectedUserType(int role){
    selectedUserType = role;
    debugPrint("UserRole-->>>>> $selectedUserType");
    notifyListeners();
  }
}