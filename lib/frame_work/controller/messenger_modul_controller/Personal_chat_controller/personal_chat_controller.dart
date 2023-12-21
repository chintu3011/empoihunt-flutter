import 'package:emploiflutter/frame_work/repository/model/messenger_model/message_data_model.dart';
import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_database_services.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_database/firebase_database.dart';

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

  final currentUserFId = BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user.vFirebaseId;


  List<MessageDataModel> messages = [];
   getUsers(String chatPersonId) async* {
    final snapshot = await FirebaseDatabase.instance.ref('Mess').child("userMessages").child(currentUserFId).child(chatPersonId).get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    print(map);
    // map.forEach((key, value) {
    //   final user = MessageDataModel.fromJson(value);
    //   messages.add(user);
    // });
  }
  sendDataToDatabase({required String chatPersonFId}){
    final date = DateTime.now();
    print("${date.year}-${date.month}-${date.day}");
    print("${date.hour}:${date.minute}:${date.second}");
    print("Current User------>$currentUserFId");
    print("Chat personFid------>$chatPersonFId");
    print(inputController.text);


    String dateStamp = "${date.year}-${date.month}-${date.day}";
    String timeStamp = "${date.hour}:${date.minute}:${date.second}";


    FirebaseDatabaseServices.databaseServices.sendMsg(
        msgData: MessageDataModel(msgType: 0, docUri: "", message: inputController.text, toId: chatPersonFId, fromId: currentUserFId, dateStamp: dateStamp, timeStamp: timeStamp),
        currentUserId: currentUserFId,
        chatPersonId: chatPersonFId);
    inputController.clear();
    notifyListeners();
  }


}