// lib/widgets/prediction_card.dart
import 'package:fixtures/core/utils/date_formatter.dart';
import 'package:fixtures/models/prediction.dart';
import 'package:flutter/material.dart';


class PredictionCard extends StatelessWidget {
  final Prediction prediction;

  const PredictionCard({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prediction: ${_getPredictionText()}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Predicted on: ${DateFormatter.formatHistoryDate(prediction.predictedAt)}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  String _getPredictionText() {
    switch (prediction.predictedResult) {
      case 'home':
        return 'Home Win';
      case 'away':
        return 'Away Win';
      case 'draw':
        return 'Draw';
      default:
        return 'Unknown';
    }
  }
}