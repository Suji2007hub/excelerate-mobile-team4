import 'package:cloud_firestore/cloud_firestore.dart';

class ReflectionModel {
  final String userId;
  final String programmeId;
  final String enrolmentId;
  final Map<String, String> responses;
  final String? aiSummary;
  final Timestamp submittedAt;
  final bool processed;

  ReflectionModel({
    required this.userId,
    required this.programmeId,
    required this.enrolmentId,
    required this.responses,
    this.aiSummary,
    required this.submittedAt,
    required this.processed,
  });

  factory ReflectionModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ReflectionModel(
      userId: data['userId'],
      programmeId: data['programmeId'],
      enrolmentId: data['enrolmentId'],
      responses: Map<String, String>.from(data['responses']),
      aiSummary: data['aiSummary'],
      submittedAt: data['submittedAt'],
      processed: data['processed'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'programmeId': programmeId,
      'enrolmentId': enrolmentId,
      'responses': responses,
      'aiSummary': aiSummary,
      'submittedAt': submittedAt,
      'processed': processed,
    };
  }
}