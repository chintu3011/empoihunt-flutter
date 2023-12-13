import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';

import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';

class ProfilePDFViewer extends StatelessWidget {
  const ProfilePDFViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colors.blackColors,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                IconButton(onPressed: (){
                  context.pop();
                }, icon: Icon(Icons.close,size: 30,color: AppColors.colors.blueColors,))
              ],
            ),
            Expanded(
              child: Container())
          ],
        ).paddingOnly(top: 10.h),
      ),
    );
  }
}
