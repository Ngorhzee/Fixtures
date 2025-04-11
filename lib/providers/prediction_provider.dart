// lib/providers/prediction_provider.dart
import 'package:flutter/material.dart';
import '../models/prediction.dart';
import '../services/prediction_service.dart';

class PredictionProvider with ChangeNotifier {
  final PredictionService _predictionService = PredictionService();
  List<Prediction> _predictions = [];
  bool _isLoading = false;
  String? _error;

  List<Prediction> get predictions => _predictions;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadPredictions() async {
    _isLoading = true;
    notifyListeners();

    try {
      _predictions = await _predictionService.getPredictions();
      _error = null;
    } catch (e) {
      _error = 'Failed to load predictions: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> savePrediction(Prediction prediction) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _predictionService.savePrediction(prediction);
      _predictions = await _predictionService.getPredictions();
      _error = null;
    } catch (e) {
      _error = 'Failed to save prediction: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}