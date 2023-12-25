
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/model/messenger_model/message_data_model.dart';
import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_database_services.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../repository/dio_client.dart';

final personalChatController = ChangeNotifierProvider((ref) => PersonalChatController());

class PersonalChatController extends ChangeNotifier{


  final inputController = TextEditingController();
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final currentUserFId = BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user.vFirebaseId;

  double progressValue = 0;


  bool isSendButtonOn = false;
  updateIsSendButtonOn(String input){
    if(input != ""){
      isSendButtonOn = true;
    }else{
      isSendButtonOn = false;
    }
    notifyListeners();
  }



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
  sendDataToDatabase({required String chatPersonFId,String? docUri,int? msgTyp,required String message}){
    final date = DateTime.now();
    print("${date.year}-${date.month}-${date.day}");
    print("${date.hour}:${date.minute}:${date.second}");
    print("Current User------>$currentUserFId");
    print("Chat personFid------>$chatPersonFId");
    print(inputController.text);

    String dateStamp = "${date.year}-${date.month}-${date.day}";
    String timeStamp = "${date.hour}:${date.minute}:${date.second}";


    FirebaseDatabaseServices.databaseServices.sendMsg(
        msgData: MessageDataModel(msgType: msgTyp??0, docUri: docUri ?? "",
            message: message, toId: chatPersonFId,
            fromId: currentUserFId, dateStamp: dateStamp, timeStamp: timeStamp),
        currentUserId: currentUserFId,
        chatPersonId: chatPersonFId);
    scrollToBottom();
    inputController.clear();
    notifyListeners();
  }







   File? imageUrl;
  String imageName = "";

  Future<void> pickImageFromMedia({required String chatPersonId}) async{
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg','png','jpeg']
    );
    if(result != null){
      final PlatformFile file = result.files.first;
      // imgUrl = file.path;
      imageUrl = File(file.path!);
      imageName = file.name;
      uploadImage(fileName: imageName, filePath: imageUrl!, chatPersonFId:chatPersonId  );
      notifyListeners();
    }else{

    }
    notifyListeners();
  }


    // XFile? camaraImage;
    pickImageFromCamara({required String chatPersonId})async{
     final image = await ImagePicker().pickImage(
         source: ImageSource.camera,
     );
     if(image != null){
       imageUrl = File(image.path);
       imageName = image.name;
       uploadImage(fileName: imageName, filePath: imageUrl!, chatPersonFId:chatPersonId  );

     }else{
     }
     notifyListeners();
    }




  File? pdfUrl;
  String pdfName="";
  Future<void> pickPdfFile({required String chatPersonId}) async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(result != null){
      final PlatformFile file = result.files.first;
      pdfName = file.name;
      pdfUrl = File(file.path!);
      uploadDocFile(docName: pdfName, docFilePath: pdfUrl!, chatPersonFId:chatPersonId);
    }else{
    }
    notifyListeners();
  }


  ///-------------------------upload data to Storage ---------------------------///

  uploadImage({required String fileName, required File filePath,required String chatPersonFId})async{
    try{
      final baseName = basename(filePath.path);
      final imageRef = firebaseStorage.ref('imagess/chatImages/$currentUserFId/$chatPersonFId/$baseName');
      // Start the file upload

      UploadTask uploadTask = imageRef.putFile(filePath);
      updateIsFileUploadVisible(true,fileName);

      uploadTask.snapshotEvents.listen((TaskSnapshot event) {
        progressValue = (event.bytesTransferred / event.totalBytes);
        print(progressValue);
        notifyListeners();
      });

      await uploadTask;
      print("process done");
      await Future.delayed(const Duration(milliseconds: 1200));
      updateIsFileUploadVisible(false,fileName);
      progressValue =0;
      await imageRef.getDownloadURL();
      final uriImg = await  imageRef.getDownloadURL();
      print(uriImg);
      sendDataToDatabase(chatPersonFId: chatPersonFId,docUri: uriImg, message: "",msgTyp: 1);
      notifyListeners();
    }catch(e){
      Future.error("FireStorage Error -------->$e");
    }
  }


  uploadDocFile({required String docName, required File docFilePath,required String chatPersonFId})async{
    try{
      final baseName = basename(docFilePath.path);
      final imageRef = firebaseStorage.ref('docss/chatDocs/$currentUserFId/$chatPersonFId/$baseName');
      // Start the file upload

      UploadTask uploadTask = imageRef.putFile(docFilePath);
      updateIsFileUploadVisible(true,docName);

      uploadTask.snapshotEvents.listen((TaskSnapshot event) {
        progressValue = (event.bytesTransferred / event.totalBytes);
        print(progressValue);
        notifyListeners();
      });

      await uploadTask;
      print("process done");
      await Future.delayed(const Duration(milliseconds: 1200));
      updateIsFileUploadVisible(false,docName);
      progressValue =0;
      await imageRef.getDownloadURL();
      final uriImg = await  imageRef.getDownloadURL();
      print(uriImg);
       sendDataToDatabase(chatPersonFId: chatPersonFId,docUri: uriImg, message: docName,msgTyp: 2);
      notifyListeners();
    }catch(e){
      Future.error("FireStorage Error -------->$e");
    }
  }

  ///-------------------------upload data to Storage ---------------------------///




///-------show uploading ------///
  bool isFileUploadProgressVisible = false;
  String uploadFileName = "";
  updateIsFileUploadVisible(bool value,String? filename){
    isFileUploadProgressVisible = value;
    uploadFileName = filename ??"";
    notifyListeners();
  }
  ///-------show uploading ------///


  ///--------------------Scroll Controller -------------------///
  ScrollController scrollController = ScrollController();

  scrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 200)); // Add a delay
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
///--------------------Scroll Controller -------------------///



  File? pdfFile;
  bool isFetchingPdf= false;

  Future urlToFilePdf(String pdfUrl)async{
    try{
      isFetchingPdf = true;
      final response = await DioClient.dio.get(pdfUrl, options: Options(responseType: ResponseType.bytes));
      if(response.statusCode == 200){
        final Uint8List bytes = Uint8List.fromList(response.data);
        List<String> list = pdfUrl.split("/");
        String baseName = list[4].trim();
        final filename = basename(baseName);
        final dir = await getApplicationDocumentsDirectory();
        var file = File('${dir.path}/$filename');
        await file.writeAsBytes(bytes, flush: true);
        pdfFile = file;
        isFetchingPdf = false;
        notifyListeners();
      }
    }catch(e){
      isFetchingPdf = false;
      Future.error("fetch pdf error-----> $e");
    }
    notifyListeners();
  }

}