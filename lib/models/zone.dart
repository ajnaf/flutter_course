import 'package:hive/hive.dart';

part 'zone.g.dart';

@HiveType(typeId: 2)
class Zone {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;

  Zone({
    this.id,
    this.name,
  });

  Zone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}
