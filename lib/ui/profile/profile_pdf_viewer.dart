import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../frame_work/repository/model/user_model/user_detail_data_model.dart';
import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';

class ProfilePDFViewer extends StatelessWidget {
  final UserModel user;
   const ProfilePDFViewer({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colors.whiteColors,
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
              child: SfPdfViewer.network(
                  '"https://api.emploihunt.com${user.tResumeUrl}',
              ))
          ],
        ).paddingOnly(top: 10.h),
      ),
    );
  }
}
