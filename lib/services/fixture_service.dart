import 'dart:convert';
import 'package:fixtures/model/fixture_model.dart';
import 'package:flutter/services.dart';

class FixtureService {
  Future<List<FixtureModel>> loadFixturesFromAssets() async {
    final String response = await rootBundle.loadString("assets/fixtures.json");
    final data = json.decode(response) as List<dynamic>;
    return data.map((json) => FixtureModel.fromJson(json)).toList();
  }
}
