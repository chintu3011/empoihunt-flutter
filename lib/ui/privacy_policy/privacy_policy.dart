import 'package:emploiflutter/frame_work/controller/setting_controller/terms_privacy_policy_controller/terms_privacy_policy_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends ConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final termsPrivacyWatch = ref.watch(termsPrivacyPolicyController);
    // var html_sSting = ;
    WebViewController webViewController = WebViewController()
        ..loadHtmlString(termsPrivacyWatch.privacyPolicyHtmlString);
    return Scaffold(
      appBar: const CommonAppBar(title: "Privacy Policy",isLeadingShow: true,),
      body: WebViewWidget(controller: webViewController,),
    );
  }
}
