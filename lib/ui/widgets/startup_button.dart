import 'package:flutter/material.dart';

class StartupButton extends StatelessWidget {
  const StartupButton({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            color: Colors.blue,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            )));
  }
}
