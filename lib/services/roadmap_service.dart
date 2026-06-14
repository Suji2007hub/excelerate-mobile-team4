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

  Future<void> updateRoadmap(String roadmapId, Map<String, dynamic> data) {
    return _roadmapsCollection.doc(roadmapId).update(data);
  }

  Future<void> deleteRoadmap(String roadmapId) {
    return _roadmapsCollection.doc(roadmapId).delete();
  }
}