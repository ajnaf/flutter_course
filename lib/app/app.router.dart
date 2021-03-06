// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/city.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/main_views/account/account_view.dart';
import '../ui/views/main_views/calculate/calculate_view.dart';
import '../ui/views/main_views/places/detail_place_view.dart';
import '../ui/views/main_views/places/places_view.dart';
import '../ui/views/main_views/saved_places/saved_places_view.dart';
import '../ui/views/startup/startupview.dart';

class Routes {
  static const String startupView = '/';
  static const String homePage = '/home-page';
  static const String accountView = '/account-view';
  static const String calculateView = '/calculate-view';
  static const String placesView = '/places-view';
  static const String detailPlacesView = '/detail-places-view';
  static const String savedPlacesView = '/saved-places-view';
  static const all = <String>{
    startupView,
    homePage,
    accountView,
    calculateView,
    placesView,
    detailPlacesView,
    savedPlacesView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.accountView, page: AccountView),
    RouteDef(Routes.calculateView, page: CalculateView),
    RouteDef(Routes.placesView, page: PlacesView),
    RouteDef(Routes.detailPlacesView, page: DetailPlacesView),
    RouteDef(Routes.savedPlacesView, page: SavedPlacesView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomePage: (data) {
      var args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(
          key: args.key,
          titlePage: args.titlePage,
        ),
        settings: data,
      );
    },
    AccountView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AccountView(),
        settings: data,
      );
    },
    CalculateView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CalculateView(),
        settings: data,
      );
    },
    PlacesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlacesView(),
        settings: data,
      );
    },
    DetailPlacesView: (data) {
      var args = data.getArgs<DetailPlacesViewArguments>(
        orElse: () => DetailPlacesViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailPlacesView(
          key: args.key,
          city: args.city,
        ),
        settings: data,
      );
    },
    SavedPlacesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SavedPlacesView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final String titlePage;
  HomePageArguments({this.key, this.titlePage});
}

/// DetailPlacesView arguments holder class
class DetailPlacesViewArguments {
  final Key key;
  final City city;
  DetailPlacesViewArguments({this.key, this.city});
}
