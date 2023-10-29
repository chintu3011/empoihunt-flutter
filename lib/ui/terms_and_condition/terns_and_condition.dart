import 'package:emploiflutter/frame_work/controller/setting/terms_privacy_policy_controller/terms_privacy_policy_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/theme/text_styles.dart';

class TermsAndCondition extends ConsumerWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final termsPrivacyWatch = ref.watch(termsPrivacyPolicyController);
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadHtmlString(termsPrivacyWatch.termHtmlString);
    // ..loadRequest(Uri.parse('https://flutter.dev'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.grey.shade300,
        title: Text("Terms And Condition", style: TextStyles.w500.copyWith(
            fontSize: 16.sp, color: AppColors.colors.blackColors),),
      ),
      body: termsPrivacyWatch.termHtmlString.isEmpty ? const Center(
        child: CircularProgressIndicator(),) : WebViewWidget(
        controller: webViewController,),
    );
  }
}
