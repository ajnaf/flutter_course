import 'package:flutter_course/ui/views/account/account_view.dart';
import 'package:flutter_course/ui/views/calculate/calculate_view.dart';
import 'package:flutter_course/ui/views/home/home_view.dart';
import 'package:flutter_course/ui/views/startup/startupview.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    // initial route is named "/"
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(
      page: HomePage,
    ),
    MaterialRoute(
      page: AccountView,
    ),
    MaterialRoute(
      page: CalculateView,
    ),
  ],
)
class $MyRouter {}
