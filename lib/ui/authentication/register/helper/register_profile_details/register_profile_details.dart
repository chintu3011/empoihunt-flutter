import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/register_profile_details_appbar.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/register_profile_details_backrgound.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';

class RegisterProfileDetails extends ConsumerStatefulWidget {
  const RegisterProfileDetails({super.key});

  @override
  ConsumerState<RegisterProfileDetails> createState() => _RegisterProfileDetailsState();
}

class _RegisterProfileDetailsState extends ConsumerState<RegisterProfileDetails> with TickerProviderStateMixin{

  @override
  void initState() {
    final vsync1 = this;
    final vsync2 = this;
    ref.read(registerProfileDetailsController).initializeLottie(vsync1,vsync2);
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(registerProfileDetailsController).resumeLottieController.dispose();
    ref.read(registerProfileDetailsController).uploadImgLottieController.dispose();
  }
  @override
  Widget build(BuildContext context,) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    return const Scaffold(
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
