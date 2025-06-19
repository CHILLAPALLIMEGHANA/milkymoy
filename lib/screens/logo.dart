import 'dart:async';
import 'package:flutter/material.dart';
import 'package:milkymoy/screens/loginscreen.dart';
 // Replace with your actual login screen import

class MilkyMoyLogoScreen extends StatefulWidget {
  const MilkyMoyLogoScreen({super.key});

  @override
  _MilkyMoyLogoScreenState createState() => _MilkyMoyLogoScreenState();
}

class _MilkyMoyLogoScreenState extends State<MilkyMoyLogoScreen> {
  @override
  void initState() {
    super.initState();
    // Auto navigate after 3 seconds
    Timer(const Duration(seconds: 6), _goToLogin);
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: _goToLogin, // Navigate on tap
          child: Image.asset(
            'assets/images/logo.jpg',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
