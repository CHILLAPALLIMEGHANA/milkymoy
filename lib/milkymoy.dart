import 'dart:async';
import 'package:flutter/material.dart';
 // or correct path

import 'package:milkymoy/screens/home/categerious.dart';

class Product {
  final String name;
  final String quantity;
  final String price;
  final String image;

  Product(this.name, this.quantity, this.price, this.image);
}

final Map<String, List<Product>> categoryProducts = {
  'Milk': [
    Product("Taaza Milk", "500 ml", "₹50", "assets/images/product1.png"),
    Product("Cow Milk", "500 ml", "₹60", "assets/images/product2.jpg"),
    Product("Taaza Milk", "500 ml", "₹50", "assets/images/product1.png"),
    Product("Cow Milk", "500 ml", "₹60", "assets/images/product2.jpg"),
    Product("Taaza Milk", "500 ml", "₹50", "assets/images/product1.png"),
    Product("Cow Milk", "500 ml", "₹60", "assets/images/product2.jpg"),
    Product("Taaza Milk", "500 ml", "₹50", "assets/images/product1.png"),
    Product("Cow Milk", "500 ml", "₹60", "assets/images/product2.jpg"),
  ],
  'Paneer': [
    Product("Fresh Paneer", "200 g", "₹80", "assets/images/paneer1.png"),
    Product("Low Fat Paneer", "200 g", "₹90", "assets/images/paneer2.png"),
    Product("Fresh Paneer", "200 g", "₹80", "assets/images/paneer1.png"),
    Product("Low Fat Paneer", "200 g", "₹90", "assets/images/paneer2.png"),
    Product("Fresh Paneer", "200 g", "₹80", "assets/images/paneer1.png"),
    Product("Low Fat Paneer", "200 g", "₹90", "assets/images/paneer2.png"),
    
  ],
  'Cheese': [
    Product("Cheddar", "200 g", "₹120", "assets/images/cheese1.png"),
    Product("Mozzarella", "200 g", "₹110", "assets/images/cheese2.png"),
    Product("Cheddar", "200 g", "₹120", "assets/images/cheese1.png"),
    Product("Mozzarella", "200 g", "₹110", "assets/images/cheese2.png"),    
    Product("Cheddar", "200 g", "₹120", "assets/images/cheese1.png"),
    Product("Mozzarella", "200 g", "₹110", "assets/images/cheese2.png"),
  ],
  'Ghee': [
    Product("Desi Ghee", "500 ml", "₹350", "assets/images/ghee1.png"),
    Product("Organic Ghee", "500 ml", "₹400", "assets/images/ghee2.png"),
    Product("Desi Ghee", "500 ml", "₹350", "assets/images/ghee1.png"),
    Product("Organic Ghee", "500 ml", "₹400", "assets/images/ghee2.png"),
    Product("Desi Ghee", "500 ml", "₹350", "assets/images/ghee1.png"),
    Product("Organic Ghee", "500 ml", "₹400", "assets/images/ghee2.png"),
  ],
  'curd': [
    Product("Buffalo Curd", "500 ml", "₹55", "assets/images/curd1.png"),
    Product("Cow Curd", "500 ml", "₹65", "assets/images/curd2.png"),
    Product("Buffalo Curd", "500 ml", "₹55", "assets/images/curd1.png"),
    Product("Cow Curd", "500 ml", "₹65", "assets/images/curd2.png"),
    Product("Buffalo Curd", "500 ml", "₹55", "assets/images/curd1.png"),
    Product("Cow Curd", "500 ml", "₹65", "assets/images/curd2.png"),
  ],
};

class MilkDeliveryApp extends StatefulWidget {
  const MilkDeliveryApp({super.key});

  @override
  _MilkDeliveryAppState createState() => _MilkDeliveryAppState();
}

class _MilkDeliveryAppState extends State<MilkDeliveryApp> {
  String selectedCategory = 'Milk';
  late ScrollController productsScrollController;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _carouselImages = [
    'assets/images/milk1.png',
    'assets/images/milk2.png',
    'assets/images/milk3.png',
  ];

  @override
  void initState() {
    super.initState();
    productsScrollController = ScrollController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });

    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 6), (timer) {
        if (_pageController.hasClients) {
          int nextPage = (_pageController.page!.round() + 1) % _carouselImages.length;
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    productsScrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = categoryProducts[selectedCategory]!;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF5FD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/profile.jpg', width: 40, height: 40),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.green),
                        SizedBox(width: 4),
                        Text("Hyderabad, India", style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.qr_code_scanner, size: 28),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Get your milk products", style: TextStyle(color: Colors.grey)),
                    Text("Delivered !", style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  SizedBox(
                    height: 140,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _carouselImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              _carouselImages[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _carouselImages.asMap().entries.map((entry) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == entry.key ? Colors.green : Colors.grey.withOpacity(0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(category: selectedCategory),
                          ),
                        );
                      },
                      child: const Text("View All", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: categoryProducts.keys.map((category) {
                    return Row(
                      children: [
                        _buildCategoryChip(category, selectedCategory == category),
                        const SizedBox(width: 8),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  controller: productsScrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: products.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return SizedBox(
                      width: 200,
                      child: _buildProductCardWithImage(
                        product.name,
                        product.quantity,
                        product.price,
                        product.image,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.search, color: Colors.green),
      //   elevation: 6,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
          productsScrollController.jumpTo(0);
        });
      },
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.green[100] : Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildProductCardWithImage(String title, String volume, String price, String imageUrl) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(volume, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      minimumSize: const Size(0, 30),
                    ),
                    child: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildBottomAppBar() {
  //   return BottomAppBar(
  //     shape: CircularNotchedRectangle(),
  //     notchMargin: 8,
  //     child: Container(
  //       height: 70,
  //       decoration: BoxDecoration(
  //         color: Colors.green,
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(30),
  //           topRight: Radius.circular(30),
  //         ),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Row(
  //             children: [
  //               SizedBox(width: 24),
  //               IconButton(
  //                 icon: Icon(Icons.home, color: Colors.white),
  //                 onPressed: () {
                  
  //                 },
  //               ),
  //               SizedBox(width: 32),
  //               IconButton(
  //                 icon: Icon(Icons.notifications, color: Colors.white),
  //                 onPressed: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
  //                 },
  //               ),
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               IconButton(
  //                 icon: Icon(Icons.shopping_cart, color: Colors.white),
  //                 onPressed: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen ()));
  //                 },
  //               ),
  //               SizedBox(width: 32),
  //               IconButton(
  //                 icon: Icon(Icons.favorite, color: Colors.white),
  //                 onPressed: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
  //                 },
  //               ),
  //               SizedBox(width: 24),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
