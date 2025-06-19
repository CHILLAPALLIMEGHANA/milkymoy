import 'package:flutter/material.dart';
import 'package:milkymoy/milkymoy.dart';
import 'package:milkymoy/screens/home/notification_screen.dart';
import 'package:milkymoy/screens/wishlist/wishlist_screen.dart';
import 'package:milkymoy/screens/cart/cart_screen.dart';
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MilkDeliveryApp(),         // Home Screen
    const NotificationScreen(),
    const CartScreen(),
    const WishlistScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Or open a search screen
        backgroundColor: Colors.white,
        elevation: 6,
        child: const Icon(Icons.search, color: Colors.green),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 24),
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () => _onTabTapped(0),
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () => _onTabTapped(1),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () => _onTabTapped(2),
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.white),
                    onPressed: () => _onTabTapped(3),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
