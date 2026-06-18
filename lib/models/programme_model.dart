import 'package:cloud_firestore/cloud_firestore.dart';

class ProgrammeModel {
  final String title;
  final String type;
  final String hostOrganisation;
  final String description;
  final List<String> skills;
  final String experienceLevel;
  final List<String> careerFields;
  final int durationWeeks;
  final int weeklyHoursRequired;
  final Timestamp applicationDeadline;
  final Timestamp startDate;
  final bool isActive;
  final Map<String, dynamic> rewards;
  final String createdBy;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ProgrammeModel({
    required this.title,
    required this.type,
    required this.hostOrganisation,
    required this.description,
    required this.skills,
    required this.experienceLevel,
    required this.careerFields,
    required this.durationWeeks,
    required this.weeklyHoursRequired,
    required this.applicationDeadline,
    required this.startDate,
    required this.isActive,
    required this.rewards,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProgrammeModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ProgrammeModel(
      title: data['title'],
      type: data['type'],
      hostOrganisation: data['hostOrganisation'],
      description: data['description'],
      skills: List<String>.from(data['skills']),
      experienceLevel: data['experienceLevel'],
      careerFields: List<String>.from(data['careerFields']),
      durationWeeks: data['durationWeeks'],
      weeklyHoursRequired: data['weeklyHoursRequired'],
      applicationDeadline: data['applicationDeadline'],
      startDate: data['startDate'],
      isActive: data['isActive'],
      rewards: Map<String, dynamic>.from(data['rewards']),
      createdBy: data['createdBy'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'type': type,
      'hostOrganisation': hostOrganisation,
      'description': description,
      'skills': skills,
      'experienceLevel': experienceLevel,
      'careerFields': careerFields,
      'durationWeeks': durationWeeks,
      'weeklyHoursRequired': weeklyHoursRequired,
      'applicationDeadline': applicationDeadline,
      'startDate': startDate,
      'isActive': isActive,
      'rewards': rewards,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}