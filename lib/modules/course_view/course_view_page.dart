import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/student_item_widget.dart';
import 'package:mobile/shared/widgets/tab_item_widget.dart';

class CourseViewPage extends StatelessWidget {
  const CourseViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: 136,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                    ),
                    color: AppColors.primary,
                    iconSize: 26,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "INFORMATICA BASICA",
                    style: AppTexts.courseInfoAppBar,
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.auto_fix_high,
                    ),
                    color: AppColors.gray,
                    iconSize: 26,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Text(
                  "Descrição ou basicamente um resumão sobre o curso em especifico né mano.",
                  style: AppTexts.courseInfoDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                ),
                child: Row(
                  children: [
                    TabItemWidget(),
                  ],
                ),
              ),
              Column(
                children: [
                  StudentItemWidget(),
                  StudentItemWidget(),
                  StudentItemWidget(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
