import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/models/home_item.dart';
import 'package:flutter_course/ui/widgets/home_container.dart';

class HomePage extends StatefulWidget {
  final String titlePage;

  HomePage({Key key, this.titlePage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';

  final List<HomeItem> data = [
    HomeItem(icon: Icons.ac_unit_outlined, title: 'ssss', color: Colors.red),
    HomeItem(icon: Icons.title_rounded, title: 'aaaa', color: Colors.blue),
    HomeItem(icon: Icons.toc_outlined, title: 'asfs', color: Colors.yellow),
    HomeItem(icon: Icons.toggle_off, title: 'ggf', color: Colors.green),
    HomeItem(
      icon: Icons.toc_sharp,
      title: 'dsfd',
    ),
    HomeItem(
      icon: Icons.toc_sharp,
      title: 'dsfd',
    ),
    HomeItem(
      icon: Icons.toc_sharp,
      title: 'dsfd',
    ),
    HomeItem(
      icon: Icons.toc_sharp,
      title: 'dsfd',
    ),
    HomeItem(icon: Icons.ac_unit_outlined, title: 'gfgf', color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titlePage),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black,
        // backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                for (HomeItem homeItem in data)
                  InkWell(
                    onTap: () {
                      setState(() {
                        text = homeItem.title;
                        print(homeItem.title);
                      });
                    },
                    child: CustomContainer(
                      homeItem: homeItem,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
