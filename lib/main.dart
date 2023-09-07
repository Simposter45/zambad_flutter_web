// ignore_for_file: avoid_catches_without_on_clauses

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/login_page/screens/login_screen.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    runApp(const DemoApp());
  } catch (e) {
    // print("Error initializing Firebase: $e");
  }
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
