import 'package:flutter/material.dart';
import 'package:ku_app/ui/forget_pass_webview_screen.dart';
import 'package:ku_app/ui/home_link_screen.dart';
import 'package:ku_app/ui/not_found_page.dart';

class RouteGenerator {
  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return _buildRoute(settings, HomeLinkScreen());
      case '/register':
        return _buildRoute(settings, ForgetPassWebview());
      default:
        return _buildRouteDialog(settings, NotFoundPage());
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }
}
