import 'package:flutter_course/app/app.router.dart';
import 'package:flutter_course/app/locator.dart';
import 'package:flutter_course/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class StartupViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();
  final _navService = locator<NavigationService>();
  final _bottomSheet = locator<BottomSheetService>();
  final _localStorageService = locator<LocalStorageService>();
  init() async {
    await _localStorageService.initialize();
  }

  void showDialog() {
    _dialogService.showDialog(
        title: 'confirmation title',
        description: 'are you sure you want to confirm ?');
  }

  void showSnackbar() {
    _snackbarService.showSnackbar(message: 'this is a snackbar');
  }

  void bottomSheet() {
    _bottomSheet.showBottomSheet(title: 'this is a bottom sheet');
  }

  void navigate() {
    _navService.navigateTo(Routes.homePage,
        arguments: HomePageArguments(titlePage: 'home page title'));
  }
}
