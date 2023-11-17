import 'dart:io';

import 'package:emploiflutter/ui/profile/helper/user_about_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_details_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_qualification_dialogbox.dart';
import 'package:emploiflutter/ui/profile/helper/user_resume_dialogbox.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:file_picker/file_picker.dart';

final profileController = ChangeNotifierProvider((ref) => ProfileController());

class ProfileController extends ChangeNotifier{



  bool isDialogShow = false;
  int dialogValue = 0;



  updateIsDialogShow(){
      isDialogShow= !isDialogShow;
      notifyListeners();
  }


  setDialogValue(int value){
    dialogValue = value;
    notifyListeners();
  }


  ///---------------- Show dialog according to its value --------------///
  dialogForShow(){
    if(dialogValue == 0){
      return const UserDetailsDialogBox();
    }else if(dialogValue == 1){
      return const UserAboutDialogBox();
    }else if(dialogValue == 2){
      return const UserQualificationDialogBox();
    }else if(dialogValue == 3){
      return const SizedBox(
        height: 200,
        child: Text("Experience"),
      );
    }else if(dialogValue == 4){
      return const UserResumeDialogBox();
    }
    notifyListeners();
  }
  ///---------------- Show dialog according to its value --------------///


  /// ------ resume Edit ----////
  late AnimationController resumeLottieController;

  String? fileName;
  File? pdfFile;
  Future<void> pickPdfFile() async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    resumeLottieController.stop();
    if(result != null){
      // print(file.name);
      // print(file.path);
      resumeLottieController.reset();
      resumeLottieController.forward();
      final PlatformFile file = result.files.first;
      fileName = file.name;
      notifyListeners();
    }else{
      resumeLottieController.stop();
    }
  }
/// ------ resume Edit ----////

}