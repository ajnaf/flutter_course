// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/account/account_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startupview.dart';

class Routes {
  static const String startupView = '/';
  static const String homePage = '/home-page';
  static const String accountView = '/account-view';
  static const all = <String>{
    startupView,
    homePage,
    accountView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.accountView, page: AccountView),
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
