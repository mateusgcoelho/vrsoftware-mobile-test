import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/course_item_widget.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          CourseItemWidget(
            onTap: () {
              Navigator.pushNamed(context, "/course_view");
            },
            name: "Informatica Basica",
          ),
          CourseItemWidget(
            onTap: () {},
            name: "Banco de Dados",
          ),
        ],
      ),
    );
  }
}
