import 'screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // This will prevent the app from crashing if firebase_options.dart is a placeholder.
    // The app will run without a Firebase connection.
    // ignore: avoid_print
    print('Firebase initialization failed. Please configure Firebase correctly.');
  }

  runApp(const ExcelerateApp());
}

class ExcelerateApp extends StatelessWidget {
  const ExcelerateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate Pathfinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE0194A),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        fontFamily: 'Roboto',
      ),
       home: const SplashScreen(),
    );
  }
}