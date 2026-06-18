import 'package:cloud_firestore/cloud_firestore.dart';

class PulseCheckModel {
  final String sessionId;
  final String userId;
  final String displayName;
  final String response;
  final Timestamp timestamp;
  final String programmeId;

  PulseCheckModel({
    required this.sessionId,
    required this.userId,
    required this.displayName,
    required this.response,
    required this.timestamp,
    required this.programmeId,
  });

  factory PulseCheckModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PulseCheckModel(
      sessionId: data['sessionId'],
      userId: data['userId'],
      displayName: data['displayName'],
      response: data['response'],
      timestamp: data['timestamp'],
      programmeId: data['programmeId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'sessionId': sessionId,
      'userId': userId,
      'displayName': displayName,
      'response': response,
      'timestamp': timestamp,
      'programmeId': programmeId,
    };
  }
}