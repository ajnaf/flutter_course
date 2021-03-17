import 'package:flutter/material.dart' hide Icon;
import 'package:flutter_course/app/locator.dart';
import 'package:flutter_course/models/area.dart';
import 'package:flutter_course/models/city.dart';
import 'package:flutter_course/models/zone.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class LocalStorageService {
  final _snackbarService = locator<SnackbarService>();
  static String _city = 'city';

  // ==================boxes ======================
  var cityBox;

  Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDirectory =
        await pathProvider.getApplicationDocumentsDirectory();

    try {
      Hive.init(appDocumentDirectory.path);
      Hive.initFlutter(appDocumentDirectory.path);
      //Area 0
      Hive.registerAdapter<Area>(AreaAdapter());
      //City 1
      Hive.registerAdapter<City>(CityAdapter());
      //Zone 2
      Hive.registerAdapter<Zone>(ZoneAdapter());
    } catch (e) {
      print(e);
    }

    await Hive.openBox<City>(_city);

    cityBox = Hive.box<City>(_city);
  }

  //=================== cities ===================

  Future addCity(City city) async {
    await cityBox.put(city.id, city);
    _snackbarService.showSnackbar(message: 'تم اضافة المدينة بنجاح');
  }

  Future deleteCity(City city) async {
    await cityBox.delete(city.id);
  }
}
