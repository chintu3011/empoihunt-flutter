import 'dart:async';

import 'package:dio/dio.dart';
import 'package:emploiflutter/ui/authentication/register/register.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:country_picker/country_picker.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../ui/authentication/login/login_otp.dart';
import '../../../repository/api_end_point.dart';
import '../../../repository/dio_client.dart';
import '../../../repository/model/check_user_exist_model/check_user_exist_model.dart';


final loginController = ChangeNotifierProvider((ref) => LoginController());

class LoginController  extends ChangeNotifier{

  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey();

  /// ----------------------------Country Picker--------------------------------///
  Country selectedCountry = Country(phoneCode: "91", countryCode: "IN", e164Sc: 0, geographic: true, level: 1, name: "India", example: "9123456789", displayName: "India (IN) [+91]", displayNameNoCountryCode: "India (IN)", e164Key: "91-IN-0");
  selectCountry(BuildContext context){
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
          textStyle: TextStyle(fontSize: 14.sp),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          inputDecoration: const InputDecoration(
              hintText: "Start typing to sear", labelText: "Search")),
      favorite: ['IN'],
      onSelect: (value) {
          selectedCountry = value;
          notifyListeners();
      });
    notifyListeners();
  }
/// ----------------------------Country Picker--------------------------------///


  loginButton(BuildContext context)async{
    if(loginKey.currentState!.validate()){
      final status = await checkUserRegistered(phoneNumberController.text);
      if(status.status == 200){
        if(context.mounted) {
          Navigator.pushAndRemoveUntil(context, PageTransition(
              child:  LoginOTP("+${selectedCountry.phoneCode}${phoneNumberController.text}"),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300)), (route) => false);
          phoneNumberController.clear();
        }
      }else if(status.status == 404){
        if(context.mounted){
          appCommonShowToast(context: context, msg: 'Opps! sorry you haven\'t register yet \n Please register',action: SnackBarAction(label: "Register", onPressed: (){
            phoneNumberController.clear();
            Navigator.push(context, PageTransition(
                child: const Register(),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(milliseconds: 300)));
          }));
        }
      }
    }
  }



  ///----------------------------- Check for user exist or not ----------------------------------------///


  Future<CheckUserExistModel> checkUserRegistered(String number) async{
    try{
      print(number);
      print(selectedCountry.phoneCode);
      Response response = await DioClient.client.getData("${APIEndPoint.checkUserExisting}${selectedCountry.phoneCode}$number");
      if(response.statusCode == 200){
        print(response.data);
        CheckUserExistModel checkUserExistModel = CheckUserExistModel.fromJson(response.data);
        return CheckUserExistModel(status: checkUserExistModel.status);
      }else{
        debugPrint(response.statusCode.toString());
        return CheckUserExistModel(status: response.statusCode);
      }
    }catch(e){
      return CheckUserExistModel(status: 404);
    }
  }

///----------------------------- Check for user exist or not ----------------------------------------///


}