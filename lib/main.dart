import 'package:flutter/material.dart';
import 'package:cv_application/pages/cv_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CV Application",
      debugShowCheckedModeBanner: false,
      home: CVScreen(),
    );
  }
}
