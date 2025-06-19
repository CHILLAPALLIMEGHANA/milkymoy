import 'package:flutter/material.dart';
import 'package:milkymoy/screens/home/categerious.dart';

import '../../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5FD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              const SizedBox(height: 16),
              _buildHeaderText(),
              const SizedBox(height: 16),
              _buildPromoBanner(),
              const SizedBox(height: 24),
              _buildCategoriesSection(context),
              const SizedBox(height: 24),
              _buildProductsGrid(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 6,
        child: const Icon(Icons.search, color: Colors.green),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildAppBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(backgroundImage: AssetImage("assets/images/profile.jpg")),
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.green),
            SizedBox(width: 4),
            Text("Hyderabad, India", style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        Icon(Icons.qr_code_scanner, size: 28),
      ],
    );
  }

  Widget _buildHeaderText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Get your milk products", style: TextStyle(color: Colors.grey)),
        Text("Delivered!", style: TextStyle(
          color: Colors.green, 
          fontSize: 18, 
          fontWeight: FontWeight.bold
        )),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        "assets/images/logo.jpg",
        height: 90,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("View All", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ["Milk", "Paneer", "Cheese", "Ghee"].map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => CategoriesScreen(category: category)),
                  ),
                  child: Chip(
                    label: Text(category),
                    backgroundColor: category == "Milk" ? Colors.green[100] : Colors.grey[200],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildProductsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        ProductCard(
          title: "Taaza Milk", 
          imagePath: "assets/images/product1.png", 
          price: "₹50",
          onPressed: () {},
        ),
        ProductCard(
          title: "Cow Milk", 
          imagePath: "assets/images/product2.png", 
          price: "₹55",
          onPressed: () {},
        ),
      ],
    );
  }
}