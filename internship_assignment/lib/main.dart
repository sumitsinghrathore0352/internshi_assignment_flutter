import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/screen/splash_screen.dart';
import './screen/login_screen.dart';
import './screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'login': (context) => MyLogin(), // Use the correct class names
        'register': (context) => MyRegister(),
      },
    );
  }
}
