import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/programme_model.dart';

class ProgrammeService {
  final CollectionReference _programmesCollection =
      FirebaseFirestore.instance.collection('programmes');

  Future<DocumentReference> createProgramme(ProgrammeModel programme) {
    return _programmesCollection.add(programme.toFirestore());
  }

  Future<ProgrammeModel?> getProgramme(String programmeId) async {
    DocumentSnapshot doc = await _programmesCollection.doc(programmeId).get();
    if (doc.exists) {
      return ProgrammeModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateProgramme(String programmeId, Map<String, dynamic> data) {
    return _programmesCollection.doc(programmeId).update(data);
  }

  Future<void> deleteProgramme(String programmeId) {
    return _programmesCollection.doc(programmeId).delete();
  }
}