
import 'package:meta/meta.dart';
import 'dart:convert';

List<DigimonModel> welcomeFromJson(String str) => List<DigimonModel>.from(json.decode(str).map((x) => DigimonModel.fromJson(x)));

String welcomeToJson(List<DigimonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DigimonModel {
  int id;
  String name;
  String level;
  Type type;

  DigimonModel({
    required this.id,
    required this.name,
    required this.level,
    required this.type,
  });

  factory DigimonModel.fromJson(Map<String, dynamic> json) => DigimonModel(
    id: json["id"],
    name: json["name"],
    level: json["level"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "level": level,
    "type": typeValues.reverse[type],
  };
}

enum Type {
  DATA,
  VACCINE,
  VIRUS
}

final typeValues = EnumValues({
  "Data": Type.DATA,
  "Vaccine": Type.VACCINE,
  "Virus": Type.VIRUS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
