import 'package:hive/hive.dart';

import 'area.dart';
import 'zone.dart';

part 'city.g.dart';

@HiveType(typeId: 1)
class City {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  Zone zone;
  @HiveField(3)
  List<Area> areas;

  City({this.id, this.name, this.zone});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    zone = json['zone'] != null ? Zone.fromJson(json['zone']) : null;
    if (json['areas'] != null) {
      areas = List<Area>.empty(growable: true);
      json['areas'].forEach((v) {
        areas.add(Area.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['zone'] = this.zone;
    data['areas'] = this.areas.map((v) => v.toJson()).toList();
    return data;
  }
}
