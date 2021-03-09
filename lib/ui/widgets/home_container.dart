import 'package:flutter/material.dart';
import 'package:flutter_course/models/home_item.dart';

class CustomContainer extends StatelessWidget {
  final HomeItem homeItem;

  const CustomContainer({
    Key key,
    this.homeItem,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
          // border: Border.all(color: Colors.black, width: 4),
          color: homeItem.color,
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: 2,
                color: Colors.grey)
          ]),
      child: Column(
        children: [
          Icon(
            homeItem.icon,
            size: 70,
          ),
          Text(
            homeItem.title,
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
