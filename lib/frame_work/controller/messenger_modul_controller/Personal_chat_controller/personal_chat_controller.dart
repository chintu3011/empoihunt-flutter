import 'package:emploiflutter/ui/utils/theme/theme.dart';

final personalChatController = ChangeNotifierProvider((ref) => PersonalChatController());

class PersonalChatController extends ChangeNotifier{


  final inputController = TextEditingController();


  bool isSendButtonOn = false;
  updateIsSendButtonOn(String input){
    if(input != ""){
      isSendButtonOn = true;
    }else{
      isSendButtonOn = false;
    }
    notifyListeners();
  }


}