import 'package:flutter/material.dart';
// import 'package:final_exam_650710689/profile/profile.dart';
import 'package:final_exam_650710689/answer1.dart';
import 'package:final_exam_650710689/answer2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Answer2(),
    );
  }
}
