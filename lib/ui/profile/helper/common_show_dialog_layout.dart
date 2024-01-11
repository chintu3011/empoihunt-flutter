import 'dart:ui';
import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import '../../utils/theme/theme.dart';

class CommonShowDialogLayout extends ConsumerWidget {
  const CommonShowDialogLayout({
    super.key,
    required this.child,
    required this.show,
    required this.userDetailDataModel
  });
  final Widget child;
  final bool show;
  final UserDetailDataModel userDetailDataModel;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final profileWatch = ref.watch(profileController);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Material(
        child: Stack(
          children: [
            child,
            if (show)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.black45,
                  child:  Center(
                      child: profileWatch.userShowDialogs(userDetailDataModel)),
                ),
              )
          ],
        ),
      ),
    );
  }
}
