// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../services/api.dart' as _i4;
import '../services/local_storage_service.dart' as _i8;
import '../services/third_party_services_module.dart' as _i12;
import '../ui/views/home/home_viewmodel.dart' as _i7;
import '../ui/views/main_views/account/account_viewmodel.dart' as _i3;
import '../ui/views/main_views/calculate/calculate_viewmodel.dart' as _i6;
import '../ui/views/main_views/places/places_viewmodel.dart' as _i9;
import '../ui/views/main_views/saved_places/saved_places_viewmodel.dart'
    as _i10;
import '../ui/views/startup/startup_viewmodel.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.AccountViewModel>(() => _i3.AccountViewModel());
  gh.lazySingleton<_i4.ApiService>(() => _i4.ApiService());
  gh.lazySingleton<_i5.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i6.CalculateViewModel>(() => _i6.CalculateViewModel());
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i7.HomeViewModel>(() => _i7.HomeViewModel());
  gh.lazySingleton<_i8.LocalStorageService>(() => _i8.LocalStorageService());
  gh.lazySingleton<_i5.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i9.PlacesViewModel>(() => _i9.PlacesViewModel());
  gh.lazySingleton<_i10.SavedPlacesViewModel>(
      () => _i10.SavedPlacesViewModel());
  gh.lazySingleton<_i5.SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  gh.lazySingleton<_i11.StartupViewModel>(() => _i11.StartupViewModel());
  return get;
}

class _$ThirdPartyServicesModule extends _i12.ThirdPartyServicesModule {
  @override
  _i5.BottomSheetService get bottomSheetService => _i5.BottomSheetService();
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
  @override
  _i5.NavigationService get navigationService => _i5.NavigationService();
  @override
  _i5.SnackbarService get snackbarService => _i5.SnackbarService();
}
