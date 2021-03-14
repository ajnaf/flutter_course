import 'package:flutter/material.dart';
import 'package:flutter_course/app/app.router.dart';
import 'package:flutter_course/app/locator.dart';
import 'package:flutter_course/models/home_item.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  String text = '';

  List<HomeItem> data = List<HomeItem>.empty(growable: true);

  initialise() {
    data = [
      HomeItem(
          icon: Icons.ac_unit_outlined,
          title: 'ssss',
          color: Colors.red,
          route: Routes.calculateView),
      HomeItem(
          icon: Icons.title_rounded,
          title: 'aaaa',
          color: Colors.blue,
          route: Routes.calculateView),
      HomeItem(
          icon: Icons.toc_outlined,
          title: 'asfs',
          color: Colors.yellow,
          route: Routes.calculateView),
      HomeItem(
          icon: Icons.toggle_off,
          title: 'ggf',
          color: Colors.green,
          route: Routes.calculateView),
      HomeItem(
          icon: Icons.toc_sharp, title: 'dsfd', route: Routes.calculateView),
      HomeItem(
          icon: Icons.toc_sharp, title: 'dsfd', route: Routes.calculateView),
      HomeItem(
          icon: Icons.toc_sharp, title: 'dsfd', route: Routes.calculateView),
      HomeItem(
          icon: Icons.toc_sharp, title: 'dsfd', route: Routes.calculateView),
      HomeItem(
          icon: Icons.ac_unit_outlined,
          title: 'gfgf',
          color: Colors.red,
          route: Routes.calculateView),
    ];
  }

  void onPressed(HomeItem homeItem) {
    text = homeItem.title;
    print(homeItem.title);
    nextPage(homeItem.route);
    notifyListeners();
  }

  final _navigationService = locator<NavigationService>();
  nextPage(String route) {
    _navigationService.navigateTo(
      route,
    );
  }
}
