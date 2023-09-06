import 'dart:async';
import 'package:driveprotect/home.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:driveprotect/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInternetAndNavigate();
  }

  Future<void> _checkInternetAndNavigate() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetDialog();
    } else {
      _navigateToHome();
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('No Internet Connection'),
        content: Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _checkInternetAndNavigate();
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen logo or content
            Image.asset('assets/asset/logo.jpg'), // Replace with your logo asset
            SizedBox(height: 20),
            CircularProgressIndicator(), // Loading indicator
          ],
        ),
      ),
    );
  }
}