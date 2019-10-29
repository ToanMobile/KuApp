import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewKuApp extends StatefulWidget {
  var linkUrl = "";
  bool isHome;

  WebviewKuApp(this.linkUrl, this.isHome);

  @override
  State<StatefulWidget> createState() => WebviewKuAppState();
}

class WebviewKuAppState extends State<WebviewKuApp> {
  final String removeHeader =
      "var elements = document.getElementsByClassName('mobile-header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}";
  final String removeBGHeader =
      "var elements = document.getElementsByClassName('bg_header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}";
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    flutterWebviewPlugin.onStateChanged.listen((viewState) async {
      if (viewState.type == WebViewState.finishLoad) {
          flutterWebviewPlugin.evalJavascript(removeHeader);
          //flutterWebviewPlugin.evalJavascript(removeBGHeader);
      }
    });
    return WebviewScaffold(
      url: widget.linkUrl,
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(alignment: FractionalOffset.center, child: CircularProgressIndicator()),
    );
  }
}
/*
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyInappBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("\n\nBrowser Ready!\n\n");
  }

  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
    this.webViewController.injectScriptCode("");
    this.webViewController.injectScriptCode("");
  }

  @override
  Future onScrollChanged(int x, int y) async {
    print("Scrolled: x:$x y:$y");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(int progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }

  @override
  void shouldOverrideUrlLoading(String url) {
    print("\n\n override $url\n\n");
    this.webViewController.loadUrl(url);
  }

  @override
  void onLoadResource(WebResourceResponse response) {
    super.onLoadResource(response);
  }

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) {
    print("""
    console output:
      sourceURL: ${consoleMessage.sourceURL}
      lineNumber: ${consoleMessage.lineNumber}
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel}
   """);
  }

  @override
  void onDownloadStart(String url) {
    print("Download of " + url);
  }
}

class WebviewKuApp extends StatefulWidget {
  var linkUrl = "";
  bool isHome;

  WebviewKuApp(this.linkUrl, this.isHome);

  @override
  State<StatefulWidget> createState() => WebviewKuAppState();
}

class WebviewKuAppState extends State<WebviewKuApp> {
  final _key = UniqueKey();
  bool _isLoadingPage;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _webViewController;

  Future<bool> _onWillPop(BuildContext context) async {
    if (await _webViewController.canGoBack()) {
      print("onwill goback");
      _webViewController.goBack();
    } else {
      print("onwill goback1111");
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Stack(
        children: <Widget>[
          WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.linkUrl,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _webViewController = webViewController;
              },
              onPageFinished: (String url) {
                if (widget.isHome) {
                  _webViewController.evaluateJavascript(
                      "var elements = document.getElementsByClassName('mobile-header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}");
                  _webViewController
                      .evaluateJavascript(
                          "var elements = document.getElementsByClassName('mobile-header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}")
                      .whenComplete(
                        () => setState(() {
                          _isLoadingPage = false;
                        }),
                      );
                } else {
                  _webViewController.evaluateJavascript(
                      "var elements = document.getElementsByClassName('bg_header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}");
                  _webViewController
                      .evaluateJavascript(
                          "var elements = document.getElementsByClassName('bg_header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}")
                      .whenComplete(
                        () => setState(() {
                          _isLoadingPage = false;
                        }),
                      );
                }
                Config.linkUrl = url;
                print('Page finished loading: $url');
              }),
          _isLoadingPage
              ? Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                )
              : Text(''),
        ],
      ),
    );
  }
}
*/
