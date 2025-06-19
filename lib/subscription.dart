import 'package:flutter/material.dart';
import 'package:milkymoy/screens/calender.dart';

void main() {
  runApp(const MaterialApp(
    home: SubscriptionPlanScreen(),
  ));
}

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  _SubscriptionPlanScreenState createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  String selectedDeliveryOption = 'Daily';

  void _onEditStep(int step) async {
    switch (step) {
      case 1:
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime(2030),
        );
        if (picked != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected Date: ${picked.toLocal()}')),
          );
        }
        break;

      case 2:
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Set Quantity Per Packet"),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Select quantity:"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_circle, color: Colors.green),
                    SizedBox(width: 12),
                    Text("1 Packet", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 12),
                    Icon(Icons.add_circle, color: Colors.green),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
            ],
          ),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DeliveryCalendarScreen()),
        );
        break;

      default:
        break;
    }
  }

  void _selectDeliveryOption(String option) {
    setState(() {
      selectedDeliveryOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Set Subscription Plan",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/paneer2.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Low Fat Paneer', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text('₹90.00', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 6),
                            Text(
                              '₹100.00',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Text('200 g'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildStepTile(context, 1, 'Start Date', 'Wednesday, 3rd April', true),
            _buildStepTile(context, 2, 'Quantity Per Packet', '1 Packet', true),
            _buildStepTile(context, 3, 'Set Delivery Schedule', 'Days you want the packets to deliver', false),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _deliveryOptionButton('Daily'),
                _deliveryOptionButton('MWF'),
                _deliveryOptionButton('TTS'),
                _deliveryOptionButton('Weekend'),
              ],
            ),
            const Spacer(),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryCalendarScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(180, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Confirm', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 8),

            // Payment Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryCalendarScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('PAYMENT', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStepTile(BuildContext context, int step, String title, String subtitle, bool isComplete) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isComplete ? Colors.green : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2),
              ),
              padding: const EdgeInsets.all(8),
              child: isComplete
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : Text('$step', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            ),
            if (!isComplete) const SizedBox(height: 8),
            if (step != 3) Container(height: 40, width: 2, color: Colors.green),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        TextButton(
          onPressed: () => _onEditStep(step),
          child: const Text('Edit'),
        ),
      ],
    );
  }

  Widget _deliveryOptionButton(String label) {
    final isSelected = selectedDeliveryOption == label;
    return OutlinedButton(
      onPressed: () => _selectDeliveryOption(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.green,
        backgroundColor: isSelected ? Colors.green : Colors.transparent,
        side: const BorderSide(color: Colors.green, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
