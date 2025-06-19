import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProductCard(
            title: "A2 Cow Milk",
            imagePath: "assets/images/image1.jpeg",
            price: "₹62",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}