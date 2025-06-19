import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'You have been logged out.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.green,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    onPressed: () {
                      // Action when OK is pressed (no navigation)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OK button pressed')),
                      );
                    },
                    child: const Text("OK"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
