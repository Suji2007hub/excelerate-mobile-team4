import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/admin_report_model.dart';

class AdminReportService {
  final CollectionReference _reportsCollection =
      FirebaseFirestore.instance.collection('adminReports');

  Future<AdminReportModel?> getAdminReport(String reportId) async {
    DocumentSnapshot doc = await _reportsCollection.doc(reportId).get();
    if (doc.exists) {
      return AdminReportModel.fromFirestore(doc);
    }
    return null;
  }
}