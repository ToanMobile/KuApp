import 'package:flutter/material.dart';
import 'package:ku_app/ui/main_screen.dart';
import 'package:ku_app/ui/not_found_page.dart';
import 'package:ku_app/utils/route_generator.dart';
import 'package:ku_app/utils/uidata.dart';
import 'utils/uidata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            platform: TargetPlatform.iOS,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.lightBlueAccent
            ),
            iconTheme: IconThemeData(color: Colors.white, size: 28),
            backgroundColor: Colors.white,
            fontFamily: Config.defaultFont),
        home: Main(),
        onGenerateRoute: RouteGenerator.authorizedRoute,
        onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
            fullscreenDialog: false, builder: (context) => new NotFoundPage()));
  }
}
