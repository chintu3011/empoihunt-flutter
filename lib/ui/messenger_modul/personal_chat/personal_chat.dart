import 'package:emploiflutter/ui/messenger_modul/personal_chat/helper/personal_back_widget.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';

class PersonalChat extends StatelessWidget {
  const PersonalChat({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.colors.clayColors));
    return  Scaffold(
      body: Stack(
        children: [
          const PersonalChatBackWidget(),
          Positioned(
            top: 30.h,
              left: 6.w,
              child: CircleAvatar(
            radius: 45.r,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.colors.whiteColors,width: 2.5),
              ),
              child: Image.asset(AppAssets.profilePicPng,fit: BoxFit.fill,),
            ),
          ))
        ],
      ),
    );
  }
}
