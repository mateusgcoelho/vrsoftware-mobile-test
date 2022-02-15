import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/student_item_widget.dart';

class AllStudentsPage extends StatelessWidget {
  const AllStudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          StudentItemWidget(),
          StudentItemWidget(),
        ],
      ),
    );
  }
}
