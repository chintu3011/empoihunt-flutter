import 'package:emploihunt/ui/authentication/login/helper/login_card.dart';
import 'package:emploihunt/ui/utils/theme/app_assets.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/theme.dart';

class LoginBackGround extends StatelessWidget {
  const LoginBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.55,
              width:  size.width,
              decoration: BoxDecoration(
                color: AppColors.colors.clayColors,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(100.r))
              ),
              child: Column(
                children: [
                  Image.asset(AppAssets.titleLogoWhite,height: 100.h,width: 350.w,),
                  Image.asset(AppAssets.phoneImg,height: 140.h,width: 270.w,),
                ],
              ),
            ),
            Container(
              height: size.height * 0.4,
              width:  size.width,
              color: Colors.white
            )
          ],
        ),
         const Positioned(child: LoginCard())
      ],
    );
  }
}
