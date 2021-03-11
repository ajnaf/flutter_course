import 'package:flutter_course/app/app.router.dart';
import 'package:flutter_course/app/locator.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  nextPage() {
    _navigationService.navigateTo(Routes.homePage,
        arguments: HomePageArguments(titlePage: 'fdsfds'));
  }
}
