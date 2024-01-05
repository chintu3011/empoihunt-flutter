import 'package:emploiflutter/frame_work/repository/model/messenger_model/message_data_model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseServices{

  FirebaseDatabaseServices._();

  static FirebaseDatabaseServices databaseServices = FirebaseDatabaseServices._();

  final firebaseMessengersRef  = FirebaseDatabase.instance.ref("Messenger");


  sendMsg({required MessageDataModel msgData, required String currentUserId, required String chatPersonId})  {

    final latestMsgRef = firebaseMessengersRef.child("LatestMessage");
    final userMsgRef = firebaseMessengersRef.child("userMessages");

    final sender = userMsgRef.child(currentUserId).child(chatPersonId).push();
    final receiver = userMsgRef.child(chatPersonId).child(currentUserId).push();

    final senderLatest = latestMsgRef.child(currentUserId).child(chatPersonId);
    final receiverLatest = latestMsgRef.child(chatPersonId).child(currentUserId);

    msgData.msgId = sender.key.toString();

    sender.set(msgData.toJson());
    receiver.set(msgData.toJson());

    senderLatest.set(msgData.toJson());

    receiverLatest.set(msgData.toJson());
  }
}