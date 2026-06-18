import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reflection_model.dart';

class ReflectionService {
  final CollectionReference _reflectionsCollection =
      FirebaseFirestore.instance.collection('reflections');

  Future<DocumentReference> createReflection(ReflectionModel reflection) {
    return _reflectionsCollection.add(reflection.toFirestore());
  }

  Future<ReflectionModel?> getReflection(String reflectionId) async {
    DocumentSnapshot doc = await _reflectionsCollection.doc(reflectionId).get();
    if (doc.exists) {
      return ReflectionModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateReflection(String reflectionId, Map<String, dynamic> data) {
    return _reflectionsCollection.doc(reflectionId).update(data);
  }
}