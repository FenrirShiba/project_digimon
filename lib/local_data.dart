import 'dart:convert';
import 'digimon_model.dart';
import 'package:flutter/services.dart';

class LocalData {
  LocalData();

  final jsonFile = 'assets/Database.json';

  Future<List<DigimonModel>> fetch() async {
    final String response = await rootBundle.loadString(jsonFile);
    final data = await json.decode(response) as List<dynamic>;

    List<DigimonModel> digimonList = [];
    for (var element in data) {
      DigimonModel digimon = DigimonModel.fromJson(element);
      digimonList.add(digimon);
    }
    return digimonList;
  }
}