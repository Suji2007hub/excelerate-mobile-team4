import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(const App());
}


