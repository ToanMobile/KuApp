import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginWebview {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_webview');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
