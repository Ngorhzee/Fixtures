import 'package:fixtures/model/fixture_model.dart';
import 'package:fixtures/services/fixture_service.dart';
import 'package:flutter/material.dart';

class FixtureProvider extends ChangeNotifier {
  FixtureService fixtureService = FixtureService();
  List<FixtureModel> fixtures = [];

  Future getFixtures() async {
    fixtures = await fixtureService.loadFixturesFromAssets();
    notifyListeners();
  }
}
