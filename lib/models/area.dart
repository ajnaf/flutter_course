import 'package:hive/hive.dart';

part 'area.g.dart';

@HiveType(typeId: 0)
class Area {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  String updatedAt;
  @HiveField(4)
  int city;
  @HiveField(5)
  String lng;
  @HiveField(6)
  String lat;

  Area(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.city,
      this.lng,
      this.lat});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'];
    lng = json['lng'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city'] = this.city;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    return data;
  }
}
