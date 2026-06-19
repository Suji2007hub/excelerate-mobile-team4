import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../models/credential_card_model.dart';

class CredentialCardService {
  final CollectionReference _cardsCollection =
      FirebaseFirestore.instance.collection('credentialCards');
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Future<CredentialCardModel?> getCredentialCard(String userId) async {
    DocumentSnapshot doc = await _cardsCollection.doc(userId).get();
    if (doc.exists) {
      return CredentialCardModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> generateCredentialCard() async {
    try {
      final callable = _functions.httpsCallable('generateCredentialCard');
      await callable.call();
    } on FirebaseFunctionsException catch (e) {
      print('Cloud Function Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }
}