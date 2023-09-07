import 'package:firebase_core/firebase_core.dart';
import 'package:first_proj/feature/home/screens/home_screen.dart';
import 'package:first_proj/feature/login_page/screens/login_screen.dart';
import 'package:first_proj/firebase_options.dart';
import 'package:first_proj/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    runApp(const DemoApp());
  } catch (e) {
    print("Error initializing Firebase: $e");
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
