import 'package:flutter/material.dart';
import 'package:mobile/app_widget.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppWidget();
  }
}
