import 'package:flutter/material.dart';
import 'package:flutter_course/models/home_item.dart';
import 'package:flutter_course/ui/views/home/home_viewmodel.dart';
import 'package:flutter_course/ui/widgets/home_container.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  final String titlePage;

  const HomePage({Key key, this.titlePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text(titlePage),
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
                      model.text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        for (HomeItem homeItem in model.data)
                          InkWell(
                            onTap: () => model.onPressed(homeItem),
                            child: CustomContainer(
                              homeItem: homeItem,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
