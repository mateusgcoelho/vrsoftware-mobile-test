import 'package:flutter/material.dart';
import 'package:mobile/modules/courses/courses_page.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    CoursesPage(),
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
                color: AppColors.primary,
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                size: 32,
                color: AppColors.gray,
              ),
              onPressed: () {
                setState(() {});
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
                "Cursos",
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
            pages[0],
          ],
        ),
      ),
    );
  }
}
