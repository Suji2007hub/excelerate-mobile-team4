import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Future<int> getActiveUserCount() async {
    // This is a simplified example. A more robust implementation might define
    // 'active' based on a recent 'lastActiveAt' timestamp.
    final querySnapshot = await _firestore.collection('users').get();
    return querySnapshot.docs.length;
  }

  Future<int> getLiveSessionCount() async {
    final querySnapshot = await _firestore
        .collection('sessions')
        .where('status', isEqualTo: 'live')
        .get();
    return querySnapshot.docs.length;
  }

  Future<int> getTodaysPulseCheckCount() async {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);
    final endOfToday = startOfToday.add(const Duration(days: 1));

    final querySnapshot = await _firestore
        .collection('pulseChecks')
        .where('timestamp', isGreaterThanOrEqualTo: startOfToday)
        .where('timestamp', isLessThan: endOfToday)
        .get();
    return querySnapshot.docs.length;
  }

  Future<void> generateAdminReport() async {
    try {
      final callable = _functions.httpsCallable('generateAdminReport');
      await callable.call();
    } on FirebaseFunctionsException catch (e) {
      debugPrint('Cloud Function Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }

  Future<void> sendAdminNudge(String userId, String message) async {
    try {
      final callable = _functions.httpsCallable('sendAdminNudge');
      await callable.call(<String, dynamic>{
        'userId': userId,
        'message': message,
      });
    } on FirebaseFunctionsException catch (e) {
      debugPrint('Cloud Function Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }
}