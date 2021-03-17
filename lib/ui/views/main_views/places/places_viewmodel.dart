import 'package:flutter_course/app/app.router.dart';
import 'package:flutter_course/app/locator.dart';
import 'package:flutter_course/models/city.dart';
import 'package:flutter_course/services/api.dart';
import 'package:flutter_course/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class PlacesViewModel extends FutureViewModel<List<City>> {
  final _api = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  @override
  Future<List<City>> futureToRun() {
    return _api.getCities();
  }

  void onCityPressed(City city) {
    _navigationService.navigateTo(Routes.detailPlacesView,
        arguments: DetailPlacesViewArguments(city: city));
  }

  saveCity(City city) {
    _localStorageService.addCity(city);
  }
}
