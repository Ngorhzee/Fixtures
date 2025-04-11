// lib/services/prediction_service.dart
import 'package:hive/hive.dart';
import '../models/prediction.dart';

class PredictionService {
  static const _boxName = 'predictions';

  Future<Box<Prediction>> _openBox() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PredictionAdapter());
    }
    return await Hive.openBox<Prediction>(_boxName);
  }

  Future<void> savePrediction(Prediction prediction) async {
    final box = await _openBox();
    await box.put(prediction.id, prediction);
  }

  Future<List<Prediction>> getPredictions() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<List<Prediction>> getPredictionsForFixture(String fixtureId) async {
    final box = await _openBox();
    return box.values.where((p) => p.fixtureId == fixtureId).toList();
  }
}

class PredictionAdapter extends TypeAdapter<Prediction> {
  @override
  final int typeId = 1;

  @override
  Prediction read(BinaryReader reader) {
    return Prediction.fromMap(reader.read());
  }

  @override
  void write(BinaryWriter writer, Prediction obj) {
    writer.write(obj.toMap());
  }
}