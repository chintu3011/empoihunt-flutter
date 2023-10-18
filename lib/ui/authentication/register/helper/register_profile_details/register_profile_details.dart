import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/register_profile_details_appbar.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/register_profile_details_backrgound.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';

import '../../../../utils/theme/app_color.dart';

class RegisterProfileDetails extends ConsumerWidget {
  const RegisterProfileDetails({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    return  const Scaffold(
      backgroundColor:  Colors.white,
      appBar: RegisterProfileDetailsAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                  RegisterProfileDetailsBackGround(),
            ],
          ),
        ),
      ),
    );
  }
}
