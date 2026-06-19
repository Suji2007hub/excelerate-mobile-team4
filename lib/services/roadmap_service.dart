import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/roadmap_model.dart';

class RoadmapService {
  final CollectionReference _roadmapsCollection =
      FirebaseFirestore.instance.collection('roadmaps');

  Future<DocumentReference> createRoadmap(RoadmapModel roadmap) {
    return _roadmapsCollection.add(roadmap.toFirestore());
  }

  Future<RoadmapModel?> getRoadmap(String roadmapId) async {
    DocumentSnapshot doc = await _roadmapsCollection.doc(roadmapId).get();
    if (doc.exists) {
      return RoadmapModel.fromFirestore(doc);
    }
    return null;
  }

  Future<RoadmapModel?> getRoadmapByUserId(String userId) async {
    // This assumes that the roadmap document ID is the same as the user ID.
    // If this is not the case, you may need to query the collection instead.
    return getRoadmap(userId);
  }

  Future<void> updateRoadmap(String roadmapId, Map<String, dynamic> data) {
    return _roadmapsCollection.doc(roadmapId).update(data);
  }

  Future<void> deleteRoadmap(String roadmapId) {
    return _roadmapsCollection.doc(roadmapId).delete();
  }
}