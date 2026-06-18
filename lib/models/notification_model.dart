import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String userId;
  final String title;
  final String body;
  final String type;
  final String relatedId;
  final bool isRead;
  final Timestamp createdAt;
  final String sentBy;

  NotificationModel({
    required this.userId,
    required this.title,
    required this.body,
    required this.type,
    required this.relatedId,
    required this.isRead,
    required this.createdAt,
    required this.sentBy,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      userId: data['userId'],
      title: data['title'],
      body: data['body'],
      type: data['type'],
      relatedId: data['relatedId'],
      isRead: data['isRead'],
      createdAt: data['createdAt'],
      sentBy: data['sentBy'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
      'type': type,
      'relatedId': relatedId,
      'isRead': isRead,
      'createdAt': createdAt,
      'sentBy': sentBy,
    };
  }
}