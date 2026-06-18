import 'package:cloud_firestore/cloud_firestore.dart';

class AdminReportModel {
  final String generatedBy;
  final String reportType;
  final Map<String, Timestamp> dateRange;
  final Map<String, dynamic> filters;
  final String fileURL;
  final String status;
  final Timestamp generatedAt;

  AdminReportModel({
    required this.generatedBy,
    required this.reportType,
    required this.dateRange,
    required this.filters,
    required this.fileURL,
    required this.status,
    required this.generatedAt,
  });

  factory AdminReportModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AdminReportModel(
      generatedBy: data['generatedBy'],
      reportType: data['reportType'],
      dateRange: Map<String, Timestamp>.from(data['dateRange']),
      filters: Map<String, dynamic>.from(data['filters']),
      fileURL: data['fileURL'],
      status: data['status'],
      generatedAt: data['generatedAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'generatedBy': generatedBy,
      'reportType': reportType,
      'dateRange': dateRange,
      'filters': filters,
      'fileURL': fileURL,
      'status': status,
      'generatedAt': generatedAt,
    };
  }
}