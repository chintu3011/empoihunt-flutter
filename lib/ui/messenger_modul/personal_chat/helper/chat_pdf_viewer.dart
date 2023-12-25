import 'package:emploiflutter/frame_work/controller/messenger_modul_controller/Personal_chat_controller/personal_chat_controller.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/theme.dart';


class ChatPDFViewer extends ConsumerStatefulWidget {
  final String pdfUrl;
   const ChatPDFViewer({super.key,required this.pdfUrl});

  @override
  ConsumerState<ChatPDFViewer> createState() => _ProfilePDFViewerState();
}

class _ProfilePDFViewerState extends ConsumerState<ChatPDFViewer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(personalChatController).urlToFilePdf(widget.pdfUrl);
    });
  }
  @override
  Widget build(BuildContext context) {
    final profileWatch = ref.watch(personalChatController);
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
