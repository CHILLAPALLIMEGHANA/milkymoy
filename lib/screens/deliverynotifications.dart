import 'package:flutter/material.dart';
import 'package:milkymoy/screens/successfulscreen.dart';

void main() {
  runApp(MaterialApp(
    home: DeliveryNotificationScreen(selectedDate: DateTime.now()),
    debugShowCheckedModeBanner: false,
  ));
}

class DeliveryNotificationScreen extends StatefulWidget {
  final DateTime selectedDate;

  const DeliveryNotificationScreen({super.key, required this.selectedDate});

  @override
  _DeliveryNotificationScreenState createState() =>
      _DeliveryNotificationScreenState();
}

class _DeliveryNotificationScreenState
    extends State<DeliveryNotificationScreen> {
  late DateTime deliveryDate;
  bool isCancelled = false;

  @override
  void initState() {
    super.initState();
    deliveryDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/paneer2.png'),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        isCancelled
                            ? 'Cancelled'
                            : 'Scheduled, ${_getFormattedDate(deliveryDate)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isCancelled ? Colors.red : Colors.black,
                        ),
                      ),
                    ]),
                    Row(
                      children: List.generate(
                        3,
                        (_) => const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/paneer2.png'),
                            radius: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Arriving 4 items', style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 12),
                Column(children: [
                  _buildDeliveryItem('A2 Cow Milk (500 ml)'),
                  _buildDeliveryItem('A2 Paneer (1 kg)'),
                  _buildDeliveryItem('A2 Cow Ghee (500 g)'),
                  _buildDeliveryItem('A2 Cow Milk (500 ml)'),
                ]),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessfulScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: isCancelled ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(text: 'Total Price\n', style: TextStyle(color: Colors.white70)),
                            TextSpan(
                              text: '₹ 280.12',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ]),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isCancelled = true;
                              deliveryDate = deliveryDate.add(const Duration(days: 1));
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          ),
                          child: Text(
                            isCancelled ? 'Cancelled' : 'Cancel',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildDeliveryItem(String itemName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.green),
          const SizedBox(width: 12),
          Text(itemName, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}


