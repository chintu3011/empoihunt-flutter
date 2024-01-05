import 'package:emploiflutter/ui/authentication/register/helper/register_background.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/services.dart';

import '../../utils/theme/theme.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    return  Scaffold(
      backgroundColor:  Colors.white,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                RegisterBackGround()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
