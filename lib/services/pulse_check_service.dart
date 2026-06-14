import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pulse_check_model.dart';

class PulseCheckService {
  final CollectionReference _pulseChecksCollection =
      FirebaseFirestore.instance.collection('pulseChecks');

  Future<DocumentReference> createPulseCheck(PulseCheckModel pulseCheck) {
    return _pulseChecksCollection.add(pulseCheck.toFirestore());
  }

  Stream<List<PulseCheckModel>> getPulseChecksForSession(String sessionId) {
    return _pulseChecksCollection
        .where('sessionId', isEqualTo: sessionId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PulseCheckModel.fromFirestore(doc))
            .toList());
  }
}