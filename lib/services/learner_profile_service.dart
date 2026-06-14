import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/learner_profile_model.dart';

class LearnerProfileService {
  final CollectionReference _profilesCollection =
      FirebaseFirestore.instance.collection('learnerProfiles');

  Future<void> createLearnerProfile(LearnerProfileModel profile) {
    return _profilesCollection.doc(profile.userId).set(profile.toFirestore());
  }

  Future<LearnerProfileModel?> getLearnerProfile(String userId) async {
    DocumentSnapshot doc = await _profilesCollection.doc(userId).get();
    if (doc.exists) {
      return LearnerProfileModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateLearnerProfile(String userId, Map<String, dynamic> data) {
    return _profilesCollection.doc(userId).update(data);
  }

  Future<void> deleteLearnerProfile(String userId) {
    return _profilesCollection.doc(userId).delete();
  }
}