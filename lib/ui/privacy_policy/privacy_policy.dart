import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../frame_work/controller/setting/terms_privacy_policy_controller/terms_privacy_policy_controller.dart';
import '../utils/theme/app_color.dart';
import '../utils/theme/text_styles.dart';

class PrivacyPolicy extends ConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final termsPrivacyWatch = ref.watch(termsPrivacyPolicyController);

    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadHtmlString(termsPrivacyWatch.privacyPolicyHtmlString);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.grey.shade300,
        title: Text("Privacy Policy",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      ),
      body: WebViewWidget(controller: webViewController,),
    );
  }
}
