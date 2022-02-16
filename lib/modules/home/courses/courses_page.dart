import 'package:flutter/material.dart';
import 'package:mobile/models/course_model.dart';
import 'package:mobile/modules/home/home_controller.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/course_item/course_item_widget.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.getAllCourses(context),
      builder: (context, snapshot) {
        List<Widget> children = [
          Center(
            child: Container(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ];

        if (snapshot.hasError) {
          children = [
            Center(
              child: Container(
                height: 400,
                child: Text(
                  snapshot.error.toString(),
                  style: AppTexts.courseInfoDescription,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ];
        }

        if (snapshot.hasData) {
          children = snapshot.data!
              .map((course) => CourseItemWidget(
                  name: course["description"],
                  onTap: () {
                    CourseModel courseObject = CourseModel.fromJson(course);

                    Navigator.pushNamed(
                      context,
                      "/course_view",
                      arguments: courseObject,
                    );
                  }))
              .toList();
        }

        return Container(
          child: Column(
            children: children,
          ),
        );
      },
    );
  }
}
