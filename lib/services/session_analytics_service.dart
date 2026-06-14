import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/session_analytics_model.dart';

class SessionAnalyticsService {
  final CollectionReference _analyticsCollection =
      FirebaseFirestore.instance.collection('sessionAnalytics');

  Future<SessionAnalyticsModel?> getSessionAnalytics(String sessionId) async {
    DocumentSnapshot doc = await _analyticsCollection.doc(sessionId).get();
    if (doc.exists) {
      return SessionAnalyticsModel.fromFirestore(doc);
    }
    return null;
  }
}