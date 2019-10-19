import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewKuApp extends StatelessWidget {
  var linkUrl = "";
  WebviewKuApp(this.linkUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        key: UniqueKey(),
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: linkUrl,
      ),
    );
  }
}
