import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/achievement_model.dart';

class AchievementService {
  final CollectionReference _achievementsCollection =
      FirebaseFirestore.instance.collection('achievements');

  Future<AchievementModel?> getAchievements(String userId) async {
    DocumentSnapshot doc = await _achievementsCollection.doc(userId).get();
    if (doc.exists) {
      return AchievementModel.fromFirestore(doc);
    }
    return null;
  }
}