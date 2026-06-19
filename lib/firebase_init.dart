import 'package:firebase_core/firebase_core.dart';

/// Initializes Firebase once, before any Firestore usage.
///
/// Note: This project currently has web runtime issues. This helper ensures
/// `Firebase.initializeApp()` is called for web/native.
Future<void> initFirebase() async {
  // Using default app configuration; for web, this relies on the generated
  // firebase_options.* file or manual config being present in the project.
  await Firebase.initializeApp();
}

