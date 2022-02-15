import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Colors.red,
      child: Column(
        children: [
          Text('oi'),
        ],
      ),
    );
  }
}
