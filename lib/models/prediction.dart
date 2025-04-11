// lib/models/prediction.dart
class Prediction {
  final String id;
  final String fixtureId;
  final String predictedResult; // 'home', 'draw', 'away'
  final DateTime predictedAt;

  Prediction({
    required this.id,
    required this.fixtureId,
    required this.predictedResult,
    required this.predictedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fixtureId': fixtureId,
      'predictedResult': predictedResult,
      'predictedAt': predictedAt.toIso8601String(),
    };
  }

  factory Prediction.fromMap(Map<String, dynamic> map) {
    return Prediction(
      id: map['id'],
      fixtureId: map['fixtureId'],
      predictedResult: map['predictedResult'],
      predictedAt: DateTime.parse(map['predictedAt']),
    );
  }
}