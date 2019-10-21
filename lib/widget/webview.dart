import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewKuApp extends StatefulWidget {
  var linkUrl = "";

  WebviewKuApp(this.linkUrl);

  @override
  State<StatefulWidget> createState() {
    return WebviewKuAppState(linkUrl);
  }
}

class WebviewKuAppState extends State<WebviewKuApp> {
  var linkUrl = "";
  final _key = UniqueKey();
  bool _isLoadingPage;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _webViewController;

  WebviewKuAppState(this.linkUrl);

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: linkUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              _webViewController = webViewController;
            },
            onPageFinished: (String url) {
              _webViewController.evaluateJavascript(
                  "var elements = document.getElementsByClassName('bg_header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}");
              _webViewController
                  .evaluateJavascript(
                      "var elements = document.getElementsByClassName('bg_header'); for(var i=0; i<elements.length; i++) { elements[i].remove();}")
                  .whenComplete(() => {
                        setState(() {
                          _isLoadingPage = false;
                        }),
                      });
              print('Page finished loading: $url');
            }),
        _isLoadingPage
            ? Container(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(),
              )
            : Text(''),
      ],
    );
  }
}
