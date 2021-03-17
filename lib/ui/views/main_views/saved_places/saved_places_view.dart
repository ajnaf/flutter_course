import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/models/city.dart';
import 'package:flutter_course/ui/views/main_views/calculate/calculate_viewmodel.dart';
import 'package:flutter_course/ui/views/main_views/places/places_viewmodel.dart';
import 'package:flutter_course/ui/views/main_views/saved_places/saved_places_viewmodel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

class SavedPlacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedPlacesViewModel>.reactive(
        viewModelBuilder: () => SavedPlacesViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: Text('saved cities view')),
              body: model.isBusy
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: ValueListenableBuilder(
                          valueListenable: Hive.box<City>('city').listenable(),
                          builder: (context, Box<City> box, _) {
                            if (box.values.isEmpty)
                              return Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      CupertinoIcons.news,
                                      size: 150,
                                      color: Colors.green.withOpacity(0.8),
                                    ),
                                    Text(
                                      "لم تقم بحفظ شيء بعد",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.green),
                                    ),
                                  ],
                                ),
                              );
                            return Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListView.builder(
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemCount: box.values.length,
                                    itemBuilder: (context, index) {
                                      City currentCity = box.getAt(index);

                                      return Dismissible(
                                          key: UniqueKey(),
                                          confirmDismiss: (direction) async {
                                            model.deleteNotificationSnackbar(
                                                onTap: () {
                                              box.put(
                                                  currentCity.id, currentCity);
                                              model.notifyListeners();
                                              return false;
                                            });
                                            return true;
                                          },
                                          onDismissed: (direction) {
                                            box.deleteAt(index);
                                          },
                                          background: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                              ),
                                              color: Colors.red,
                                            ),
                                          ),
                                          secondaryBackground: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                              ),
                                              color: Colors.red,
                                            ),
                                          ),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () => model
                                                .onCityPressed(currentCity),
                                            child: Container(
                                                margin: EdgeInsets.all(8),
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Text(
                                                  currentCity.name,
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                )),
                                          )));
                                    }));
                          }),
                    ),
            ));
  }
}
