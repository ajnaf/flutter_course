import 'package:flutter/material.dart';
import 'package:flutter_course/app/app.router.dart';
import 'package:flutter_course/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الشركة العامة للكهرباء',
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
