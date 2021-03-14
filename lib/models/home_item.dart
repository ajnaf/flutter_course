import 'package:flutter/material.dart';

class HomeItem {
  final IconData icon;
  final String title;
  final Color color;
  final String route;

  HomeItem({
    this.icon,
    this.title,
    this.color = Colors.indigo,
    this.route,
  });
}
