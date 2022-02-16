import 'package:flutter/material.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/home/home_controller.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/student/student_item_widget.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: controller.getAllStudents(context),
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
              .map((student) => StudentItemWidget(
                  name: student["name"],
                  subTitleName: student["created_at"],
                  onTap: () {
                    StudentModel studentObject = StudentModel.fromJson(student);

                    Navigator.pushNamed(
                      context,
                      "/student_view",
                      arguments: studentObject,
                    );
                  }))
              .toList();
        }

        return children.length == 0
            ? Text(
                "Nenhum aluno registrado!",
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 16,
                ),
              )
            : Container(
                child: Column(
                  children: children,
                ),
              );
      },
    );
  }
}
