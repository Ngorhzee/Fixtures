// lib/screens/history/history_screen.dart
import 'package:fixtures/providers/prediction_provider.dart';
import 'package:fixtures/view/history/prediction_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PredictionProvider>(context, listen: false).loadPredictions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);

    if (predictionProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (predictionProvider.error != null) {
      return Center(child: Text(predictionProvider.error!));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: predictionProvider.predictions.length,
      itemBuilder: (context, index) {
        final prediction = predictionProvider.predictions[index];
        return PredictionCard(prediction: prediction);
      },
    );
  }
}