import 'package:flutter/material.dart';
import 'package:milkymoy/screens/cart/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String volume;
  final String price;
  final String originalPrice;
  final String imagePath;

  const ProductDetailScreen({
    required this.title,
    required this.volume,
    required this.price,
    required this.originalPrice,
    required this.imagePath,
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

enum DetailTab { about, nutrition, benefits }

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 2;
  DetailTab selectedTab = DetailTab.about;

  @override
  Widget build(BuildContext context) {
    double unitPrice =
        double.tryParse(widget.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;
    double totalPrice = quantity * unitPrice;

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Details", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      widget.imagePath,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _infoTile("Packaging", widget.volume, "ml"),
                        _infoTile("Energy", "45", "kcal"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        )),
                    const SizedBox(height: 6),
                    Text("₹ ${widget.price}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 36), // Leave space for quantity control
                  ],
                ),
              ),
              Positioned(
                bottom: 12,
                right: 24,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child:
                              Icon(Icons.remove, color: Colors.white, size: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() => quantity++),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.add,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedTab = DetailTab.about),
                  child: _tabText("About", selected: selectedTab == DetailTab.about),
                ),
                GestureDetector(
                  onTap: () =>
                      setState(() => selectedTab = DetailTab.nutrition),
                  child: _tabText("Nutritional Facts",
                      selected: selectedTab == DetailTab.nutrition),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedTab = DetailTab.benefits),
                  child: _tabText("Benefits",
                      selected: selectedTab == DetailTab.benefits),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildTabContent(),
          ),
          const Spacer(),
          Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  '₹ ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: const Icon(Icons.shopping_cart, size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String label, String value, String unit) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        const SizedBox(height: 2),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black)),
          TextSpan(
              text: ' $unit',
              style: const TextStyle(color: Colors.green, fontSize: 14)),
        ])),
      ],
    );
  }

  Widget _tabText(String label, {bool selected = false}) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16,
        color: Colors.green,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case DetailTab.nutrition:
        return const Text(
          'Each serving contains essential vitamins and minerals such as Calcium, Vitamin D, and Protein to support your daily nutrition.',
          style: TextStyle(fontSize: 16),
        );
      case DetailTab.benefits:
        return const Text(
          'Boosts immunity, strengthens bones, aids digestion, and is perfect for a healthy lifestyle.',
          style: TextStyle(fontSize: 16),
        );
      case DetailTab.about:
      default:
        return const Text(
          'Desigo premium A2 cow milk is sourced from purebred Gir and Sahiwal cows of India. The 1L quantity comes in environment friendly packaging that keeps freshness intact and easy to handle.',
          style: TextStyle(fontSize: 16),
        );
    }
  }
}