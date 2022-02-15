import 'package:flutter/material.dart';
import 'package:mobile/modules/home/courses/courses_page.dart';
import 'package:mobile/modules/home/home_controller.dart';
import 'package:mobile/modules/home/students/students_page.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final pages = [
    CoursesPage(),
    StudentsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                size: 32,
                color: controller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.gray,
              ),
              onPressed: () {
                setState(() {
                  controller.setPage(0);
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.people,
                size: 32,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.gray,
              ),
              onPressed: () {
                setState(() {
                  controller.setPage(1);
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 46,
                bottom: 24,
              ),
              title: Text(
                controller.currentPage == 0 ? "Cursos" : "Alunos",
                style: AppTexts.appBar,
              ),
              trailing: InkWell(
                onTap: () {},
                child: Ink(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary,
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
            pages[controller.currentPage],
          ],
        ),
      ),
    );
  }
}
