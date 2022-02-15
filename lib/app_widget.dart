import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/models/course_model.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/course_view/course_view_page.dart';
import 'package:mobile/modules/home/home_page.dart';
import 'package:mobile/modules/splash/splash_page.dart';
import 'package:mobile/modules/student_view/student_view_page.dart';
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
        "/course_view": (context) => CourseViewPage(
              course: ModalRoute.of(context)!.settings.arguments as CourseModel,
            ),
        "/student_view": (context) => StudentViewPage(
              student:
                  ModalRoute.of(context)!.settings.arguments as StudentModel,
            ),
      },
    );
  }
}
