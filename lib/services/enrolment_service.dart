import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/enrolment_model.dart';

class EnrolmentService {
  final CollectionReference _enrolmentsCollection =
      FirebaseFirestore.instance.collection('enrolments');

  Future<DocumentReference> createEnrolment(EnrolmentModel enrolment) {
    return _enrolmentsCollection.add(enrolment.toFirestore());
  }

  Future<EnrolmentModel?> getEnrolment(String enrolmentId) async {
    DocumentSnapshot doc = await _enrolmentsCollection.doc(enrolmentId).get();
    if (doc.exists) {
      return EnrolmentModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateEnrolment(String enrolmentId, Map<String, dynamic> data) {
    return _enrolmentsCollection.doc(enrolmentId).update(data);
  }

  Future<void> deleteEnrolment(String enrolmentId) {
    return _enrolmentsCollection.doc(enrolmentId).delete();
  }
}