import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/modules/home/home_page.dart';
import 'package:mobile/modules/splash/splash_page.dart';
import 'package:mobile/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YOURCOURSE",
      initialRoute: "/splash",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.purple,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              brightness: Brightness.dark,
            ),
      ),
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
