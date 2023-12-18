import '../user_model/user_login_model.dart';

class AuthResponseModel{
  final UserLoginModel? user;
  final String? error;

  AuthResponseModel({this.user,this.error});
}