import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/recommendation_letter_model.dart';

class RecommendationLetterService {
  final CollectionReference _lettersCollection =
      FirebaseFirestore.instance.collection('recommendationLetters');

  Future<DocumentReference> createRecommendationLetter(
      RecommendationLetterModel letter) {
    return _lettersCollection.add(letter.toFirestore());
  }

  Future<RecommendationLetterModel?> getRecommendationLetter(
      String letterId) async {
    DocumentSnapshot doc = await _lettersCollection.doc(letterId).get();
    if (doc.exists) {
      return RecommendationLetterModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateRecommendationLetter(
      String letterId, Map<String, dynamic> data) {
    return _lettersCollection.doc(letterId).update(data);
  }
}