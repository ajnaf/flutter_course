import 'package:flutter_course/ui/views/home/home_view.dart';
import 'package:flutter_course/ui/views/main_views/account/account_view.dart';
import 'package:flutter_course/ui/views/main_views/calculate/calculate_view.dart';
import 'package:flutter_course/ui/views/main_views/places/detail_place_view.dart';
import 'package:flutter_course/ui/views/main_views/places/places_view.dart';
import 'package:flutter_course/ui/views/main_views/saved_places/saved_places_view.dart';
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
    MaterialRoute(
      page: PlacesView,
    ),
    MaterialRoute(
      page: DetailPlacesView,
    ),
    MaterialRoute(
      page: SavedPlacesView,
    ),
  ],
)
class $MyRouter {}
