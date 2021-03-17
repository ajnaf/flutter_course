import 'package:flutter/material.dart';
import 'package:flutter_course/models/city.dart';
import 'package:flutter_course/ui/views/main_views/places/places_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DetailPlacesView extends StatelessWidget {
  final City city;

  const DetailPlacesView({Key key, this.city}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlacesViewModel>.reactive(
        viewModelBuilder: () => PlacesViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text('cities view')),
              body: Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'المدينة تتبع',
                        style: TextStyle(fontSize: 30, color: Colors.red),
                      ),
                      Text(city.zone.name, style: TextStyle(fontSize: 30)),
                      Text(
                        'بعض المناطق في المدينة',
                        style: TextStyle(fontSize: 30, color: Colors.red),
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: city.areas.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Center(
                                child: Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      city.areas[index].name,
                                      style: TextStyle(fontSize: 30),
                                    )))),
                      ),
                      InkWell(
                        onTap: () => model.saveCity(city),
                        child: Container(
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.green),
                          child: Text(
                            'حفظ',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
