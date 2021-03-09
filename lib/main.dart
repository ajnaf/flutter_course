import 'package:flutter/material.dart';
import 'package:flutter_course/ui/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الشركة العامة للكهرباء',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(titlePage: 'الصفحة الرئيسية'),
    );
  }
}
