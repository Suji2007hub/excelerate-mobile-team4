import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

class ProgressService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  /// Calls the 'completeRoadmapStep' Cloud Function.
  ///
  /// The [stepId] is the identifier for the roadmap step being completed.
  Future<void> completeRoadmapStep(String stepId) async {
    try {
      final callable = _functions.httpsCallable('completeRoadmapStep');
      await callable.call(<String, dynamic>{
        'stepId': stepId,
      });
    } on FirebaseFunctionsException catch (e) {
      debugPrint('Cloud Function Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }
}