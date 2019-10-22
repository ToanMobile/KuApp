import 'dart:async';

import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
