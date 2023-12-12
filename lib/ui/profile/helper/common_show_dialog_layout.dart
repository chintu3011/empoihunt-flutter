import 'dart:ui';
import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import '../../utils/theme/theme.dart';

class CommonShowDialogLayout extends ConsumerWidget {
  const CommonShowDialogLayout({
    super.key,
    required this.child,
    required this.show,
  });
  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final profileWatch = ref.watch(profileController);
    return Material(
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
                    child: profileWatch.jobSeekerShowDialogs()),
              ),
            )
        ],
      ),
    );
  }
}
