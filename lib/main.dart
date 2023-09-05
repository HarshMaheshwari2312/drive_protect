import 'package:flutter/material.dart';
import 'package:driveprotect/splash.dart';
import 'package:driveprotect/dashboard.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => SplashScreen(), // Define your initial route
        '/dashboard': (context) => DashboardPage(), // Define the dashboard route
        // Add more routes here if needed
      },
    );
  }
}
