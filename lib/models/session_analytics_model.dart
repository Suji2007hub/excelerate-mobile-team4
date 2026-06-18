import 'package:cloud_firestore/cloud_firestore.dart';

class SessionAnalyticsModel {
  final String sessionId;
  final String programmeId;
  final String instructorId;
  final int totalResponses;
  final Map<String, int> breakdown;
  final double confusionRate;
  final List<String> topConfusedLearners;
  final List<Map<String, dynamic>> timeline;
  final Timestamp generatedAt;

  SessionAnalyticsModel({
    required this.sessionId,
    required this.programmeId,
    required this.instructorId,
    required this.totalResponses,
    required this.breakdown,
    required this.confusionRate,
    required this.topConfusedLearners,
    required this.timeline,
    required this.generatedAt,
  });

  factory SessionAnalyticsModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SessionAnalyticsModel(
      sessionId: data['sessionId'],
      programmeId: data['programmeId'],
      instructorId: data['instructorId'],
      totalResponses: data['totalResponses'],
      breakdown: Map<String, int>.from(data['breakdown']),
      confusionRate: (data['confusionRate'] as num).toDouble(),
      topConfusedLearners: List<String>.from(data['topConfusedLearners']),
      timeline: List<Map<String, dynamic>>.from(data['timeline']),
      generatedAt: data['generatedAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'sessionId': sessionId,
      'programmeId': programmeId,
      'instructorId': instructorId,
      'totalResponses': totalResponses,
      'breakdown': breakdown,
      'confusionRate': confusionRate,
      'topConfusedLearners': topConfusedLearners,
      'timeline': timeline,
      'generatedAt': generatedAt,
    };
  }
}