import 'package:cloud_firestore/cloud_firestore.dart';

class RoadmapModel {
  final String userId;
  final String title;
  final Timestamp generatedAt;
  final String targetTimeline;
  final String careerField;
  final int totalSteps;
  final int completedSteps;
  final double progressPercent;
  final String status;
  final List<Map<String, dynamic>> steps;

  RoadmapModel({
    required this.userId,
    required this.title,
    required this.generatedAt,
    required this.targetTimeline,
    required this.careerField,
    required this.totalSteps,
    required this.completedSteps,
    required this.progressPercent,
    required this.status,
    required this.steps,
  });

  factory RoadmapModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RoadmapModel(
      userId: data['userId'],
      title: data['title'],
      generatedAt: data['generatedAt'],
      targetTimeline: data['targetTimeline'],
      careerField: data['careerField'],
      totalSteps: data['totalSteps'],
      completedSteps: data['completedSteps'],
      progressPercent: (data['progressPercent'] as num).toDouble(),
      status: data['status'],
      steps: List<Map<String, dynamic>>.from(data['steps']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'generatedAt': generatedAt,
      'targetTimeline': targetTimeline,
      'careerField': careerField,
      'totalSteps': totalSteps,
      'completedSteps': completedSteps,
      'progressPercent': progressPercent,
      'status': status,
      'steps': steps,
    };
  }
}