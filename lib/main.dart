import 'package:flutter/material.dart';
import 'package:milkymoy/milkymoy.dart';
import 'package:milkymoy/screens/alerts/alert_screen.dart';
import 'package:milkymoy/screens/logo.dart';
import 'package:milkymoy/screens/search_screen/search_screen.dart';
import 'screens/home/home_screen.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/wishlist/wishlist_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milky Moy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 148, 23, 148),
      ),
      home: const MilkyMoyLogoScreen(),
    );
  }
}

