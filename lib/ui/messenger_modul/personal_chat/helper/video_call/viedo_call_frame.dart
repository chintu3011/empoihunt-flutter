import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallFrame extends StatefulWidget {
  const VideoCallFrame({Key? key, required this.callID, required this.userName}) : super(key: key);
  final String callID;
  final String userName;

  @override
  State<VideoCallFrame> createState() => _VideoCallFrameState();
}

class _VideoCallFrameState extends State<VideoCallFrame> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.callID);
  }
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1972285556, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "9d8abde5e76da12a4ce61c3855dde3b898d06317fdc6a1b4fe4ddc49d37ee7a0", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: "${widget.userName}jkvcv",
      userName: widget.userName,
      callID: widget.callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}