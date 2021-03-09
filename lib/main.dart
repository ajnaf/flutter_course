import 'package:flutter/material.dart';
import 'package:flutter_course/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الشركة العامة للكهرباء',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(titlePage: 'الصفحة الرئيسية'),
    );
  }
}
