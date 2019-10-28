import 'dart:async';

import 'package:KUCasino/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

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
    this.webViewController.injectScriptCode("var elements = document.getElementsByClassName('mobile-header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}");
    this.webViewController.injectScriptCode("var elements = document.getElementsByClassName('bg_header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}");
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
  final MyInappBrowser browser = new MyInappBrowser();

  WebviewKuApp(this.linkUrl, this.isHome);

  @override
  State<StatefulWidget> createState() => WebviewKuAppState();
}

class WebviewKuAppState extends State<WebviewKuApp> {
  bool _isLoadingPage = true;
  InAppWebViewController _webViewController;

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Stack(
        children: <Widget>[
          InAppWebView(
            initialUrl: widget.linkUrl,
            initialHeaders: {},
            initialOptions: [
              /*
                *  InAppWebViewOptions(
                    useShouldOverrideUrlLoading: true,
                    useOnTargetBlank: true,
                    //useOnLoadResource: true,
                    useOnDownloadStart: true,
                    resourceCustomSchemes: ["my-special-custom-scheme"],
                    contentBlockers: [
                      ContentBlocker(
                          ContentBlockerTrigger(".*",
                              resourceType: [ContentBlockerTriggerResourceType.IMAGE, ContentBlockerTriggerResourceType.STYLE_SHEET],
                              ifTopUrl: ["https://getbootstrap.com/"]),
                          ContentBlockerAction(ContentBlockerActionType.BLOCK)
                      )
                    ]
                ),
                AndroidInAppWebViewOptions(
                  databaseEnabled: true,
                  appCacheEnabled: true,
                  domStorageEnabled: true,
                  geolocationEnabled: true,
                  //blockNetworkImage: true,
                ),
                iOSInAppWebViewOptions(
                    preferredContentMode: iOSInAppWebViewUserPreferredContentMode.DESKTOP
                )*/
            ],
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {
              setState(() {
                this._isLoadingPage = true;
              });
            },
            onProgressChanged: (InAppWebViewController controller, int progress) {},
            onLoadStop: (InAppWebViewController controller, String url) {
              Config.linkUrl = url;
              print('Page finished loading: $url');
              setState(() {
                this._isLoadingPage = false;
              });
              if (widget.isHome) {
                /* _webViewController.addJavaScriptHandler(
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
                      );*/
              }
            },
          ),
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
