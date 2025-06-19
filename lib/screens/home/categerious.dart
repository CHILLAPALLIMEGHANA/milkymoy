import 'package:flutter/material.dart';
import 'package:milkymoy/screens/productdetailscreen.dart';
 // Make sure this path matches your folder structure

class CategoriesScreen extends StatelessWidget {
  final String category;

  const CategoriesScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text("Categories"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Milk"),
              Tab(text: "Paneer"),
              Tab(text: "Ghee"),
              Tab(text: "Cheese"),
              Tab(text: "Curd"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProductList(context, "Milk"),
            _buildProductList(context, "Paneer"),
            _buildProductList(context, "Ghee"),
            _buildProductList(context, "Cheese"),
            _buildProductList(context, "Curd"),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, String category) {
    final products = {
      "Milk": [
        {
          "title": "A2 Cow Milk",
          "volume": "500 ml",
          "price": "₹62",
          "originalPrice": "₹72",
          "image": "assets/images/product1.png"
        },
        {
          "title": "Buffalo Milk",
          "volume": "500 ml",
          "price": "₹55",
          "originalPrice": "₹65",
          "image": "assets/images/product2.jpg"
        },
        {
          "title": "A2 Cow Milk",
          "volume": "500 ml",
          "price": "₹62",
          "originalPrice": "₹72",
          "image": "assets/images/product1.png"
        },
        {
          "title": "Buffalo Milk",
          "volume": "500 ml",
          "price": "₹55",
          "originalPrice": "₹65",
          "image": "assets/images/product2.jpg"
        },
        {
          "title": "A2 Cow Milk",
          "volume": "500 ml",
          "price": "₹62",
          "originalPrice": "₹72",
          "image": "assets/images/product1.png"
        },
        {
          "title": "Buffalo Milk",
          "volume": "500 ml",
          "price": "₹55",
          "originalPrice": "₹65",
          "image": "assets/images/product2.jpg"
        },
      ],
      "Paneer": [
        {
          "title": "Fresh Paneer",
          "volume": "200 g",
          "price": "₹80",
          "originalPrice": "₹90",
          "image": "assets/images/paneer1.png"
        },
        {
          "title": "Low Fat Paneer",
          "volume": "200 g",
          "price": "₹90",
          "originalPrice": "₹100",
          "image": "assets/images/paneer2.png"
        },
        {
          "title": "Fresh Paneer",
          "volume": "200 g",
          "price": "₹80",
          "originalPrice": "₹90",
          "image": "assets/images/paneer1.png"
        },
        {
          "title": "Low Fat Paneer",
          "volume": "200 g",
          "price": "₹90",
          "originalPrice": "₹100",
          "image": "assets/images/paneer2.png"
        },
        {
          "title": "Fresh Paneer",
          "volume": "200 g",
          "price": "₹80",
          "originalPrice": "₹90",
          "image": "assets/images/paneer1.png"
        },
        {
          "title": "Low Fat Paneer",
          "volume": "200 g",
          "price": "₹90",
          "originalPrice": "₹100",
          "image": "assets/images/paneer2.png"
        },
      ],
      "Ghee": [
        {
          "title": "Desi Ghee",
          "volume": "500 ml",
          "price": "₹350",
          "originalPrice": "₹400",
          "image": "assets/images/ghee1.png"
        },
        {
          "title": "Organic Ghee",
          "volume": "500 ml",
          "price": "₹400",
          "originalPrice": "₹450",
          "image": "assets/images/ghee2.png"
        },
        {
          "title": "Desi Ghee",
          "volume": "500 ml",
          "price": "₹350",
          "originalPrice": "₹400",
          "image": "assets/images/ghee1.png"
        },
        {
          "title": "Organic Ghee",
          "volume": "500 ml",
          "price": "₹400",
          "originalPrice": "₹450",
          "image": "assets/images/ghee2.png"
        },
        {
          "title": "Desi Ghee",
          "volume": "500 ml",
          "price": "₹350",
          "originalPrice": "₹400",
          "image": "assets/images/ghee1.png"
        },
        {
          "title": "Organic Ghee",
          "volume": "500 ml",
          "price": "₹400",
          "originalPrice": "₹450",
          "image": "assets/images/ghee2.png"
        },
      ],
      "Cheese": [
        {
          "title": "Cheddar Cheese",
          "volume": "200 g",
          "price": "₹120",
          "originalPrice": "₹140",
          "image": "assets/images/cheese1.png"
        },
        {
          "title": "Mozzarella",
          "volume": "200 g",
          "price": "₹110",
          "originalPrice": "₹130",
          "image": "assets/images/cheese2.png"
        },
        {
          "title": "Cheddar Cheese",
          "volume": "200 g",
          "price": "₹120",
          "originalPrice": "₹140",
          "image": "assets/images/cheese1.png"
        },
        {
          "title": "Mozzarella",
          "volume": "200 g",
          "price": "₹110",
          "originalPrice": "₹130",
          "image": "assets/images/cheese2.png"
        },
        {
          "title": "Cheddar Cheese",
          "volume": "200 g",
          "price": "₹120",
          "originalPrice": "₹140",
          "image": "assets/images/cheese1.png"
        },
        {
          "title": "Mozzarella",
          "volume": "200 g",
          "price": "₹110",
          "originalPrice": "₹130",
          "image": "assets/images/cheese2.png"
        },
      ],
      "Curd": [
        {
          "title": "Cow Curd",
          "volume": "500 ml",
          "price": "₹55",
          "originalPrice": "₹65",
          "image": "assets/images/curd1.png"
        },
        {
          "title": "Buffalo Curd",
          "volume": "500 ml",
          "price": "₹65",
          "originalPrice": "₹75",
          "image": "assets/images/curd2.png"
        },
        {
          "title": "Cow Curd",
          "volume": "500 ml",
          "price": "₹55",
          "originalPrice": "₹65",
          "image": "assets/images/curd1.png"
        },
        {
          "title": "Buffalo Curd",
          "volume": "500 ml",
          "price": "₹65",
          "originalPrice": "₹75",
          "image": "assets/images/curd2.png"
        },
        {
          "title": "Cow Curd",
          "volume": "500 ml",
          "price": "₹55",
          "originalPrice": "₹65",
          "image": "assets/images/curd1.png"
        },
        {
          "title": "Buffalo Curd",
          "volume": "500 ml",
          "price": "₹65",
          "originalPrice": "₹75",
          "image": "assets/images/curd2.png"
        },
      ],
    };

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: products[category]!.length,
      itemBuilder: (context, index) {
        final product = products[category]![index];
        return _buildProductCard(
          context: context,
          title: product["title"]!,
          volume: product["volume"]!,
          price: product["price"]!,
          originalPrice: product["originalPrice"]!,
          imagePath: product["image"]!,
        );
      },
    );
  }

  Widget _buildProductCard({
    required BuildContext context,
    required String title,
    required String volume,
    required String price,
    required String originalPrice,
    required String imagePath,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(
              title: title,
              volume: volume,
              price: price,
              originalPrice: originalPrice,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.green.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(volume, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(price,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        Text(originalPrice,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart")),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text("Add", style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
