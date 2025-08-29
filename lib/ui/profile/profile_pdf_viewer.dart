import 'package:emploihunt/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploihunt/ui/utils/extension/context_extension.dart';
import 'package:emploihunt/ui/utils/extension/widget_extension.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../frame_work/repository/model/user_model/user_detail_data_model.dart';
import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';

class ProfilePDFViewer extends ConsumerStatefulWidget {
  final UserModel user;
   const ProfilePDFViewer({super.key,required this.user});

  @override
  ConsumerState<ProfilePDFViewer> createState() => _ProfilePDFViewerState();
}

class _ProfilePDFViewerState extends ConsumerState<ProfilePDFViewer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(profileController).urlToFilePdf(widget.user.tResumeUrl!);
    });
  }
  @override
  Widget build(BuildContext context) {
    final profileWatch = ref.watch(profileController);
    return Scaffold(
      backgroundColor: AppColors.colors.whiteColors,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: (){
                      context.pop();
                    }, icon: Icon(Icons.close,size: 30,color: AppColors.colors.blueColors,))
              ],
            ),
            Expanded(
                child: profileWatch.pdfFile ==null?const Center(child: CircularProgressIndicator(),):
                PDFView(
                  filePath: profileWatch.pdfFile!.path,
                ))
          ],
        ).paddingOnly(top: 10.h),
      ),
    );
  }
}
