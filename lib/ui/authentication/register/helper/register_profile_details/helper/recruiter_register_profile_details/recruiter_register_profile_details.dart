import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/recruiter_register_profile_details_controller.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/recruiter_register_profile_details/helper/recruiter_register_profile_details_appbar.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_loading.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';

import 'helper/recruiter_register_profile_details_backrgound.dart';

class RecruiterRegisterProfileDetails extends ConsumerStatefulWidget {
  const RecruiterRegisterProfileDetails({super.key});

  @override
  ConsumerState<RecruiterRegisterProfileDetails> createState() => _RegisterProfileDetailsState();
}

class _RegisterProfileDetailsState extends ConsumerState<RecruiterRegisterProfileDetails> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    ref.read(recruiterRegisterProfileDetailsController).uploadImgLottieController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(recruiterRegisterProfileDetailsController).uploadImgLottieController.dispose();
  }
  @override
  Widget build(BuildContext context,) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    return CommonLoading(
      show: ref.watch(recruiterRegisterProfileDetailsController).isLoading,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
          backgroundColor:  Colors.white,
          appBar: RecruiterRegisterProfileDetailsAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                      RecruiterRegisterProfileDetailsBackGround(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
