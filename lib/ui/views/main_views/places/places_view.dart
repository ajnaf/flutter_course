import 'package:flutter/material.dart';
import 'package:flutter_course/ui/views/main_views/calculate/calculate_viewmodel.dart';
import 'package:flutter_course/ui/views/main_views/places/places_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PlacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlacesViewModel>.reactive(
        viewModelBuilder: () => PlacesViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text('cities view')),
              body: model.isBusy
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: ListView.builder(
                          itemCount: model.data.length,
                          itemBuilder: (context, index) => Center(
                                  child: InkWell(
                                onTap: () =>
                                    model.onCityPressed(model.data[index]),
                                child: Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      model.data[index].name,
                                      style: TextStyle(fontSize: 30),
                                    )),
                              ))),
                    ),
            ));
  }
}
