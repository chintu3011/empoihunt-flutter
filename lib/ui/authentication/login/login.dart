import 'package:emploihunt/ui/authentication/login/helper/login_background.dart';
import 'package:emploihunt/ui/utils/theme/app_color.dart';
import 'package:flutter/services.dart';

import '../../utils/theme/theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        backgroundColor:  Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                LoginBackGround()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
