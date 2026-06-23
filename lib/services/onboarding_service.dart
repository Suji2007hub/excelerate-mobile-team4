import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

class OnboardingService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  /// Calls the 'submitOnboardingQuiz' Cloud Function with the user's answers.
  ///
  /// The [answers] parameter should be a map representing the quiz results,
  /// for example: {'question1': 'answerA', 'question2': 'answerC'}
  Future<void> submitOnboardingQuiz(Map<String, dynamic> answers) async {
    try {
      final callable = _functions.httpsCallable('submitOnboardingQuiz');
      await callable.call(answers);
    } on FirebaseFunctionsException catch (e) {
      // It's a good practice to handle specific errors from the Cloud Function.
      // For example, if the function throws an error with a specific code.
      debugPrint('Cloud Function Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }
}