import 'package:cloud_firestore/cloud_firestore.dart';

class CredentialCardModel {
  final String userId;
  final String displayName;
  final String careerField;
  final int level;
  final String levelName;
  final int badgeCount;
  final int certificateCount;
  final int totalXP;
  final int scholarshipsUSD;
  final List<String> topBadges;
  final String imageURL;
  final Timestamp generatedAt;
  final String linkedInShareURL;

  CredentialCardModel({
    required this.userId,
    required this.displayName,
    required this.careerField,
    required this.level,
    required this.levelName,
    required this.badgeCount,
    required this.certificateCount,
    required this.totalXP,
    required this.scholarshipsUSD,
    required this.topBadges,
    required this.imageURL,
    required this.generatedAt,
    required this.linkedInShareURL,
  });

  factory CredentialCardModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CredentialCardModel(
      userId: data['userId'],
      displayName: data['displayName'],
      careerField: data['careerField'],
      level: data['level'],
      levelName: data['levelName'],
      badgeCount: data['badgeCount'],
      certificateCount: data['certificateCount'],
      totalXP: data['totalXP'],
      scholarshipsUSD: data['scholarshipsUSD'],
      topBadges: List<String>.from(data['topBadges']),
      imageURL: data['imageURL'],
      generatedAt: data['generatedAt'],
      linkedInShareURL: data['linkedInShareURL'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'displayName': displayName,
      'careerField': careerField,
      'level': level,
      'levelName': levelName,
      'badgeCount': badgeCount,
      'certificateCount': certificateCount,
      'totalXP': totalXP,
      'scholarshipsUSD': scholarshipsUSD,
      'topBadges': topBadges,
      'imageURL': imageURL,
      'generatedAt': generatedAt,
      'linkedInShareURL': linkedInShareURL,
    };
  }
}