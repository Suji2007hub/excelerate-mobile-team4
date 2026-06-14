import 'package:cloud_firestore/cloud_firestore.dart';

class SessionModel {
  final String title;
  final String programmeId;
  final String instructorId;
  final Timestamp scheduledAt;
  final Timestamp? endedAt;
  final String status;
  final List<String> enrolledLearnerIds;
  final int activeParticipants;
  final bool pulseCheckEnabled;

  SessionModel({
    required this.title,
    required this.programmeId,
    required this.instructorId,
    required this.scheduledAt,
    this.endedAt,
    required this.status,
    required this.enrolledLearnerIds,
    required this.activeParticipants,
    required this.pulseCheckEnabled,
  });

  factory SessionModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SessionModel(
      title: data['title'],
      programmeId: data['programmeId'],
      instructorId: data['instructorId'],
      scheduledAt: data['scheduledAt'],
      endedAt: data['endedAt'],
      status: data['status'],
      enrolledLearnerIds: List<String>.from(data['enrolledLearnerIds']),
      activeParticipants: data['activeParticipants'],
      pulseCheckEnabled: data['pulseCheckEnabled'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'programmeId': programmeId,
      'instructorId': instructorId,
      'scheduledAt': scheduledAt,
      'endedAt': endedAt,
      'status': status,
      'enrolledLearnerIds': enrolledLearnerIds,
      'activeParticipants': activeParticipants,
      'pulseCheckEnabled': pulseCheckEnabled,
    };
  }
}