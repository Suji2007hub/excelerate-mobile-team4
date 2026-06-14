import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;
  final String role;
  final Timestamp createdAt;
  final Timestamp lastActiveAt;
  final String fcmToken;
  final bool onboardingCompleted;
  final Map<String, bool> notificationPrefs;
  final String? linkedExcelerateId;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
    required this.role,
    required this.createdAt,
    required this.lastActiveAt,
    required this.fcmToken,
    required this.onboardingCompleted,
    required this.notificationPrefs,
    this.linkedExcelerateId,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      role: data['role'],
      createdAt: data['createdAt'],
      lastActiveAt: data['lastActiveAt'],
      fcmToken: data['fcmToken'],
      onboardingCompleted: data['onboardingCompleted'],
      notificationPrefs: Map<String, bool>.from(data['notificationPrefs']),
      linkedExcelerateId: data['linkedExcelerateId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'role': role,
      'createdAt': createdAt,
      'lastActiveAt': lastActiveAt,
      'fcmToken': fcmToken,
      'onboardingCompleted': onboardingCompleted,
      'notificationPrefs': notificationPrefs,
      'linkedExcelerateId': linkedExcelerateId,
    };
  }
}