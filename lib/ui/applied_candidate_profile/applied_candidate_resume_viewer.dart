import 'package:emploiflutter/frame_work/controller/applied_candidate_list_controller/applied_candidate_profile_controller.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';

class AppliedCandidateResumeViewer extends ConsumerStatefulWidget {
  final String pdfUrl;
  const AppliedCandidateResumeViewer({super.key,required this.pdfUrl});

  @override
  ConsumerState createState() => _AppliedCandidateResumeViewerState();
}

class _AppliedCandidateResumeViewerState extends ConsumerState<AppliedCandidateResumeViewer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(appliedCandidateProfileController).urlToFilePdf(widget.pdfUrl);
    });
  }
  @override
  Widget build(BuildContext context) {
    final appliedCandidateWatch = ref.watch(appliedCandidateProfileController);
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
                child: appliedCandidateWatch.pdfFile ==null?const Center(child: CircularProgressIndicator(),):
                PDFView(
                filePath: appliedCandidateWatch.pdfFile! .path,
                ))
          ],
        ).paddingOnly(top: 10.h),
      ),
    );
  }
}
