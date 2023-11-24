import 'package:emploiflutter/ui/utils/theme/theme.dart';

final makeNewChatController = ChangeNotifierProvider((ref) => MakeNewChatController());

class MakeNewChatController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }
}