#import "FlutterPluginWebviewPlugin.h"
#import <flutter_plugin_webview/flutter_plugin_webview-Swift.h>

@implementation FlutterPluginWebviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginWebviewPlugin registerWithRegistrar:registrar];
}
@end
