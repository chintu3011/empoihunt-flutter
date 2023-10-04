import 'package:emploiflutter/ui/authentication/login/helper/login_background.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/services.dart';

import '../../utils/theme/theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors, //or set color with: Color(0xFF0000FF)
    ));
    return const Scaffold(
      backgroundColor:  Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginBackGround()
          ],
        ),
      ),
    );
  }
}
