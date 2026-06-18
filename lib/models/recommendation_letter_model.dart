import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendationLetterModel {
  final String learnerId;
  final String learnerName;
  final String issuedBy;
  final String issuerName;
  final String issuerTitle;
  final String programmeId;
  final String content;
  final String fileURL;
  final Timestamp issuedAt;
  final String status;

  RecommendationLetterModel({
    required this.learnerId,
    required this.learnerName,
    required this.issuedBy,
    required this.issuerName,
    required this.issuerTitle,
    required this.programmeId,
    required this.content,
    required this.fileURL,
    required this.issuedAt,
    required this.status,
  });

  factory RecommendationLetterModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RecommendationLetterModel(
      learnerId: data['learnerId'],
      learnerName: data['learnerName'],
      issuedBy: data['issuedBy'],
      issuerName: data['issuerName'],
      issuerTitle: data['issuerTitle'],
      programmeId: data['programmeId'],
      content: data['content'],
      fileURL: data['fileURL'],
      issuedAt: data['issuedAt'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'learnerId': learnerId,
      'learnerName': learnerName,
      'issuedBy': issuedBy,
      'issuerName': issuerName,
      'issuerTitle': issuerTitle,
      'programmeId': programmeId,
      'content': content,
      'fileURL': fileURL,
      'issuedAt': issuedAt,
      'status': status,
    };
  }
}