package com.pichillilorenzo.flutter_inappbrowser;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.JavascriptInterface;

import com.pichillilorenzo.flutter_inappbrowser.InAppWebView.InAppWebView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class JavaScriptBridgeInterface {
  private static final String LOG_TAG = "JSBridgeInterface";
  public static final String name = "flutter_inappbrowser";
  private FlutterWebView flutterWebView;
  private InAppBrowserActivity inAppBrowserActivity;

  public static final String flutterInAppBroserJSClass = "window." + name + ".callHandler = function() {" +
    "var _callHandlerID = setTimeout(function(){});" +
    "window." + name + "._callHandler(arguments[0], _callHandlerID, JSON.stringify(Array.prototype.slice.call(arguments, 1)));" +
    "return new Promise(function(resolve, reject) {" +
    "  window." + name + "[_callHandlerID] = resolve;" +
    "});" +
  "}";

  public JavaScriptBridgeInterface(Object obj) {
    if (obj instanceof InAppBrowserActivity)
      this.inAppBrowserActivity = (InAppBrowserActivity) obj;
    else if (obj instanceof FlutterWebView)
      this.flutterWebView = (FlutterWebView) obj;
  }

  @JavascriptInterface
  public void _callHandler(String handlerName, final String _callHandlerID, String args) {
    final Map<String, Object> obj = new HashMap<>();
    if (inAppBrowserActivity != null)
      obj.put("uuid", inAppBrowserActivity.uuid);
    obj.put("handlerName", handlerName);
    obj.put("args", args);

    // java.lang.RuntimeException: Methods marked with @UiThread must be executed on the main thread.
    // https://github.com/pichillilorenzo/flutter_inappbrowser/issues/98
    final Handler handler = new Handler(Looper.getMainLooper());
    handler.post(new Runnable() {
      @Override
      public void run() {
        getChannel().invokeMethod("onCallJsHandler", obj, new MethodChannel.Result() {
          @Override
          public void success(Object json) {
            InAppWebView webView = (inAppBrowserActivity != null) ? inAppBrowserActivity.webView : flutterWebView.webView;

            if (webView == null) {
              // The webview has already been disposed, ignore.
              return;
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
              webView.evaluateJavascript("window." + name + "[" + _callHandlerID + "](" + json + "); delete window." + name + "[" + _callHandlerID + "];", null);
            }
            else {
              webView.loadUrl("javascript:window." + name + "[" + _callHandlerID + "](" + json + "); delete window." + name + "[" + _callHandlerID + "];");
            }
          }

          @Override
          public void error(String s, String s1, Object o) {
            Log.d(LOG_TAG, "ERROR: " + s + " " + s1);
          }

          @Override
          public void notImplemented() {

          }
        });
      }
    });
  }

  @JavascriptInterface
  public void _resourceLoaded(String json) {
    try {

      JSONObject jsonObject = new JSONObject(json);

      final Map<String, Object> obj = new HashMap<>();

      if (inAppBrowserActivity != null)
        obj.put("uuid", inAppBrowserActivity.uuid);

      String initiatorType = jsonObject.getString("initiatorType");
      String url = jsonObject.getString("name");
      Double startTime = jsonObject.getDouble("startTime");
      Double duration = jsonObject.getDouble("duration");

      obj.put("initiatorType", initiatorType);
      obj.put("url", url);
      obj.put("startTime", startTime);
      obj.put("duration", duration);

      // java.lang.RuntimeException: Methods marked with @UiThread must be executed on the main thread.
      // https://github.com/pichillilorenzo/flutter_inappbrowser/issues/98
      final Handler handler = new Handler(Looper.getMainLooper());
      handler.post(new Runnable() {
        @Override
        public void run() {
          getChannel().invokeMethod("onLoadResource", obj);
        }
      });

    } catch (final JSONException e) {
      Log.e(LOG_TAG, "Json parsing error: " + e.getMessage());
    }
  }

  private MethodChannel getChannel() {
    return (inAppBrowserActivity != null) ? InAppBrowserFlutterPlugin.instance.channel : flutterWebView.channel;
  }
}
