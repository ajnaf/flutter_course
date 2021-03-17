import 'package:flutter_course/app/app.router.dart';
import 'package:flutter_course/app/locator.dart';
import 'package:flutter_course/models/city.dart';
import 'package:flutter_course/services/api.dart';
import 'package:flutter_course/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class SavedPlacesViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  void onCityPressed(City city) {
    _navigationService.navigateTo(Routes.detailPlacesView,
        arguments: DetailPlacesViewArguments(city: city));
  }

  void deleteNotificationSnackbar({Function onTap}) async {
    _snackbarService.showSnackbar(
        message: 'هل انت متأكد انك تريد مسح الخبر',
        mainButtonTitle: 'الغاء',
        onMainButtonTapped: onTap);
  }
}
