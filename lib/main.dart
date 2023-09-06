import 'package:flutter/material.dart';
import 'package:driveprotect/splash.dart';
import 'package:driveprotect/dashboard.dart';
import 'package:driveprotect/login.dart';
import 'package:driveprotect/signUp.dart';
import 'package:driveprotect/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drive Protect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => SplashScreen(),
        'Login': (context) => Login(),
        'SignUp': (context) => SignUp(),
        'Home': (context) => HomeScreen(),
        '/dashboard': (context) => DashboardPage(), // Define the dashboard route
        // Add more routes here if needed
      },
    );
  }
}