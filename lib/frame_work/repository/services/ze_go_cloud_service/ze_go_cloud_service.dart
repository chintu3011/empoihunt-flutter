import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZeGoCloudService{


  ZeGoCloudService._();
  static final ZeGoCloudService service = ZeGoCloudService._();



  /// on App's user login
  void onUserLogin(UserDetailDataModel userModel) {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID:  1972285556 /*input your AppID*/,
      appSign: "9d8abde5e76da12a4ce61c3855dde3b898d06317fdc6a1b4fe4ddc49d37ee7a0" /*input your AppSign*/,
      userID: userModel.user.vFirebaseId.toString(),
      userName: userModel.user.vFirstName.replaceFirst(" ", "_"),
      plugins: [ZegoUIKitSignalingPlugin()],
    );
    print("Cloud called");
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }



}