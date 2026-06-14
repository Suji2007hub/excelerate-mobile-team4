import 'package:cloud_firestore/cloud_firestore.dart';

class EnrolmentModel {
  final String userId;
  final String programmeId;
  final String? roadmapId;
  final int? roadmapStepNumber;
  final String status;
  final Timestamp enrolledAt;
  final Timestamp? completedAt;
  final bool reflectionSubmitted;
  final String? feedbackSummary;

  EnrolmentModel({
    required this.userId,
    required this.programmeId,
    this.roadmapId,
    this.roadmapStepNumber,
    required this.status,
    required this.enrolledAt,
    this.completedAt,
    required this.reflectionSubmitted,
    this.feedbackSummary,
  });

  factory EnrolmentModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return EnrolmentModel(
      userId: data['userId'],
      programmeId: data['programmeId'],
      roadmapId: data['roadmapId'],
      roadmapStepNumber: data['roadmapStepNumber'],
      status: data['status'],
      enrolledAt: data['enrolledAt'],
      completedAt: data['completedAt'],
      reflectionSubmitted: data['reflectionSubmitted'],
      feedbackSummary: data['feedbackSummary'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'programmeId': programmeId,
      'roadmapId': roadmapId,
      'roadmapStepNumber': roadmapStepNumber,
      'status': status,
      'enrolledAt': enrolledAt,
      'completedAt': completedAt,
      'reflectionSubmitted': reflectionSubmitted,
      'feedbackSummary': feedbackSummary,
    };
  }
}