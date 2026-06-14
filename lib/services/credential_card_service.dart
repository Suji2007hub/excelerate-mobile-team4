import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/credential_card_model.dart';

class CredentialCardService {
  final CollectionReference _cardsCollection =
      FirebaseFirestore.instance.collection('credentialCards');

  Future<CredentialCardModel?> getCredentialCard(String userId) async {
    DocumentSnapshot doc = await _cardsCollection.doc(userId).get();
    if (doc.exists) {
      return CredentialCardModel.fromFirestore(doc);
    }
    return null;
  }
}