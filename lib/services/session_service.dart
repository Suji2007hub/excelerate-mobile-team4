import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/session_model.dart';

class SessionService {
  final CollectionReference _sessionsCollection =
      FirebaseFirestore.instance.collection('sessions');

  Future<DocumentReference> createSession(SessionModel session) {
    return _sessionsCollection.add(session.toFirestore());
  }

  Future<SessionModel?> getSession(String sessionId) async {
    DocumentSnapshot doc = await _sessionsCollection.doc(sessionId).get();
    if (doc.exists) {
      return SessionModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateSession(String sessionId, Map<String, dynamic> data) {
    return _sessionsCollection.doc(sessionId).update(data);
  }

  Future<void> deleteSession(String sessionId) {
    return _sessionsCollection.doc(sessionId).delete();
  }
}