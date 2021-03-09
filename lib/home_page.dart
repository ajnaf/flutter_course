import 'package:flutter/material.dart';

class DataModel {
  final IconData icon;
  final String title;
  final Color color;

  DataModel({
    this.icon,
    this.title,
    this.color = Colors.indigo,
  });
}

class HomePage extends StatefulWidget {
  final String titlePage;

  HomePage({Key key, this.titlePage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';

  final List<DataModel> data = [
    DataModel(icon: Icons.ac_unit_outlined, title: 'ssss', color: Colors.red),
    DataModel(icon: Icons.title_rounded, title: 'aaaa', color: Colors.blue),
    DataModel(icon: Icons.toc_outlined, title: 'asfs', color: Colors.yellow),
    DataModel(icon: Icons.toggle_off, title: 'ggf', color: Colors.green),
    DataModel(
      icon: Icons.toc_sharp,
      title: 'dsfd',
    ),
    DataModel(icon: Icons.ac_unit_outlined, title: 'gfgf', color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titlePage),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 60),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                for (DataModel d in data)
                  InkWell(
                    onTap: () {
                      setState(() {
                        text = d.title;
                        print(d.title);
                      });
                    },
                    child: CustomContainer(
                      d: d,
                      title: d.title,
                      icon: d.icon,
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

class CustomContainer extends StatelessWidget {
  final DataModel d;
  final String title;
  final IconData icon;
  const CustomContainer({Key key, this.d, this.title, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.black, width: 4),
          color: d.color,
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
            icon,
            size: 70,
          ),
          Text(
            d.title,
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
