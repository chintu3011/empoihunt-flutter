import '../user_model/user_model.dart';

class AuthResponseModel{
  final UserModel? user;
  final String? error;

  AuthResponseModel({this.user,this.error});
}