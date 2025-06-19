import 'package:flutter/material.dart';
import 'package:milkymoy/subscription.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
      name: 'A2 Cow Milk',
      price: 62,
      oldPrice: 72,
      quantity: 2,
      volume: '500 ml',
      imagePath: 'assets/images/product1.png',
    ),
    CartItem(
      name: 'Low Fat paneer',
      price: 90,
      oldPrice: 100,
      quantity: 1,
      volume: '200 g',
      imagePath: 'assets/images/paneer2.png',
    ),
  ];

  final TextEditingController taxController = TextEditingController(text: '16');
  final TextEditingController deliveryController = TextEditingController(text: '8');

  @override
  Widget build(BuildContext context) {
    int subtotal = cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
    int tax = int.tryParse(taxController.text) ?? 0;
    int deliveryCharge = int.tryParse(deliveryController.text) ?? 0;
    int grandTotal = subtotal + tax + deliveryCharge;

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.imagePath,
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text("₹${item.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 6),
                                  Text(
                                    "₹${item.oldPrice}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(item.volume),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (item.quantity > 1) item.quantity--;
                                  });
                                },
                              ),
                              Text('${item.quantity}', style: const TextStyle(color: Colors.white)),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 300,
                  color: Colors.green.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _priceRow('Subtotal', subtotal),
                      Row(
                        children: [
                          Expanded(
                            child: _priceRow(
                              'Tax',
                              tax,
                              boxed: true,
                              controller: taxController,
                              alignRight: false,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _priceRow(
                              'Delivery charge',
                              deliveryCharge,
                              boxed: true,
                              controller: deliveryController,
                              alignRight: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 220, // ✅ Smaller box width
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'Grand Total: ₹$grandTotal',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SubscriptionPlanScreen()),
                    );
                  },
                  child: const Text('PAYMENT', style: TextStyle(fontSize: 18)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _priceRow(String label, int amount,
      {bool boxed = false, bool editable = false, TextEditingController? controller, bool alignRight = false}) {
    return Container(
      decoration: boxed
          ? BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(6),
            )
          : null,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
      margin: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          editable
              ? SizedBox(
                  height: 30,
                  width: 50,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}), // Refresh totals on change
                  ),
                )
              : Text(
                  '₹$amount',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final int price;
  final int oldPrice;
  int quantity;
  final String volume;
  final String imagePath;

  CartItem({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.quantity,
    required this.volume,
    required this.imagePath,
  });
}
