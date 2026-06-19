class FirestoreKeyUtils {
  FirestoreKeyUtils._();

  /// Deterministic document id for enrolments.
  /// This allows the UI to fetch/update the same enrolment doc
  /// without needing a random id returned from `add()`.
  static String enrolmentDocId(String userId, String programmeId) {
    return '${userId}_$programmeId';
  }
}


