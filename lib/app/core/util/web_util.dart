import 'package:webview_flutter/webview_flutter.dart';

class WebUtil {
  static Future<String> getUserAgent() async {
    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    Object object = await controller.runJavaScriptReturningResult('navigator.userAgent');
    return object.toString().replaceAll("\"", "");
  }
}
