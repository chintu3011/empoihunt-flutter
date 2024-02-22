import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallTest extends StatefulWidget {
  final String name;
  const VideoCallTest({super.key, required this.name});

  @override
  State<VideoCallTest> createState() => _VideoCallTestState();
}

class _VideoCallTestState extends State<VideoCallTest> {
  final nameController = TextEditingController();
  final callIdController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CallPage(callID: "callIdController.text", userName: widget.name.toLowerCase())));

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     TextFormField(
      //       controller: nameController,
      //       decoration: InputDecoration(
      //         hintText: "Enter Your name"
      //       ),
      //     ),
      //     SizedBox(height: 20,),
      //     TextFormField(
      //       controller: callIdController,
      //       decoration: InputDecoration(
      //           hintText: "Video call id"
      //       ),
      //     ),
      //     SizedBox(height: 20,),
      //     ElevatedButton(onPressed: (){
      //
      //
      //       Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CallPage(callID: "callIdController.text", userName: nameController.text)));
      //     }, child: Text("Submit"))
      //   ],
      // ) ,
    );
  }
}

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID, required this.userName}) : super(key: key);
  final String callID;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 4956430, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "dab2e616d743c06bebc3890a00b2ac16948929c1b17b75ed3846457f3fa7cd4b", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: "${userName}23eE@",
      userName: userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}