import 'package:cloud_firestore/cloud_firestore.dart';

class AchievementModel {
  final String userId;
  final int totalXP;
  final int level;
  final String levelName;
  final List<Map<String, dynamic>> badges;
  final List<Map<String, dynamic>> certificates;
  final int scholarshipsEarned;
  final List<String> completedProgrammes;

  AchievementModel({
    required this.userId,
    required this.totalXP,
    required this.level,
    required this.levelName,
    required this.badges,
    required this.certificates,
    required this.scholarshipsEarned,
    required this.completedProgrammes,
  });

  factory AchievementModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AchievementModel(
      userId: data['userId'],
      totalXP: data['totalXP'],
      level: data['level'],
      levelName: data['levelName'],
      badges: List<Map<String, dynamic>>.from(data['badges']),
      certificates: List<Map<String, dynamic>>.from(data['certificates']),
      scholarshipsEarned: data['scholarshipsEarned'],
      completedProgrammes: List<String>.from(data['completedProgrammes']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'totalXP': totalXP,
      'level': level,
      'levelName': levelName,
      'badges': badges,
      'certificates': certificates,
      'scholarshipsEarned': scholarshipsEarned,
      'completedProgrammes': completedProgrammes,
    };
  }
}