import 'package:cloud_firestore/cloud_firestore.dart';

class LearnerProfileModel {
  final String userId;
  final String careerField;
  final String experienceLevel;
  final String primaryGoal;
  final String weeklyHours;
  final String targetTimeline;
  final List<String> existingCredentials;
  final String topPriority;
  final String? roadmapId;
  final Timestamp updatedAt;

  LearnerProfileModel({
    required this.userId,
    required this.careerField,
    required this.experienceLevel,
    required this.primaryGoal,
    required this.weeklyHours,
    required this.targetTimeline,
    required this.existingCredentials,
    required this.topPriority,
    this.roadmapId,
    required this.updatedAt,
  });

  factory LearnerProfileModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return LearnerProfileModel(
      userId: data['userId'],
      careerField: data['careerField'],
      experienceLevel: data['experienceLevel'],
      primaryGoal: data['primaryGoal'],
      weeklyHours: data['weeklyHours'],
      targetTimeline: data['targetTimeline'],
      existingCredentials: List<String>.from(data['existingCredentials']),
      topPriority: data['topPriority'],
      roadmapId: data['roadmapId'],
      updatedAt: data['updatedAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'careerField': careerField,
      'experienceLevel': experienceLevel,
      'primaryGoal': primaryGoal,
      'weeklyHours': weeklyHours,
      'targetTimeline': targetTimeline,
      'existingCredentials': existingCredentials,
      'topPriority': topPriority,
      'roadmapId': roadmapId,
      'updatedAt': updatedAt,
    };
  }
}