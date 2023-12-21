import 'package:firebase_database/firebase_database.dart';

class MessageDataModel {
   String? msgId;
   int msgType;
   String docUri;
   String message;
   String toId;
   String fromId;
   String dateStamp;
   String timeStamp;

  MessageDataModel({
     this.msgId,
    required this.msgType,
    required this.docUri,
    required this.message,
    required this.toId,
    required this.fromId,
    required this.dateStamp,
    required this.timeStamp,
  });

   factory MessageDataModel.fromSnapshot(DataSnapshot snapshot) {
     Map<dynamic, dynamic> json = snapshot.value as Map<dynamic, dynamic>;

       return MessageDataModel(
         msgId: json['msgId'],
         msgType: json['msgType'],
         docUri: json['docUri'],
         message: json['message'],
         toId: json['toId'],
         fromId: json['fromId'],
         dateStamp: json['dateStamp'],
         timeStamp: json['timeStamp'],
       );
   }
  // factory MessageDataModel.fromJson(Map<dynamic, dynamic> json) {
  //   return MessageDataModel(
  //     msgId: json['msgId'],
  //     msgType: json['msgType'],
  //     docUri: json['docUri'],
  //     message: json['message'],
  //     toId: json['toId'],
  //     fromId: json['fromId'],
  //     dateStamp: json['dateStamp'],
  //     timeStamp: json['timeStamp'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msgId'] = msgId;
    data['msgType'] = msgType;
    data['docUri'] = docUri;
    data['message'] = message;
    data['toId'] = toId;
    data['fromId'] = fromId;
    data['dateStamp'] = dateStamp;
    data['timeStamp'] = timeStamp;
    return data;
  }
}
