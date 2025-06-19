import 'package:flutter/material.dart';
import 'deliverynotifications.dart';

class DeliveryCalendarScreen extends StatefulWidget {
  const DeliveryCalendarScreen({super.key});

  @override
  _DeliveryCalendarScreenState createState() => _DeliveryCalendarScreenState();
}

class _DeliveryCalendarScreenState extends State<DeliveryCalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  final int _currentMonth = DateTime.now().month;
  final int _currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Delivery Calendar', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: 'April',
                items: ['March', 'April', 'May'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                    .map((day) => Text(day, style: const TextStyle(fontWeight: FontWeight.bold)))
                    .toList(),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemCount: 35,
                itemBuilder: (context, index) {
                  int day = index - _getFirstDayOffset() + 1;
                  bool isCurrentMonth = day > 0 && day <= _getDaysInMonth();
                  bool isSelected = isCurrentMonth &&
                      day == _selectedDate.day &&
                      _currentMonth == _selectedDate.month;

                  Color textColor = Colors.black;
                  if ([5, 10, 15].contains(day)) {
                    textColor = Colors.green;
                  } else if ([8, 12].contains(day)) {
                    textColor = Colors.red;
                  } else if ([18, 22].contains(day)) {
                    textColor = Colors.orange;
                  }

                  return GestureDetector(
                    onTap: isCurrentMonth
                        ? () {
                            setState(() {
                              _selectedDate = DateTime(_currentYear, _currentMonth, day);
                            });
                          }
                        : null,
                    child: Container(
                      decoration: isSelected
                          ? const BoxDecoration(color: Colors.black, shape: BoxShape.circle)
                          : null,
                      alignment: Alignment.center,
                      child: Text(
                        isCurrentMonth ? day.toString() : '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : textColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildLegendDot(Colors.green, 'Delivered'),
                  _buildLegendDot(Colors.red, 'Not delivered'),
                  _buildLegendDot(Colors.orange, 'To be delivered'),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery on ${_formatDate(_selectedDate)}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Arriving 4 items', style: TextStyle(color: Colors.grey[600])),
                        Row(
                          children: List.generate(
                            3,
                            (index) => const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/paneer2.png'),
                                radius: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Cancel logic if needed
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[100],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Cancel', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliveryNotificationScreen(
                                  selectedDate: _selectedDate,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                          label: const Text('View', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getFirstDayOffset() {
    final firstDayOfMonth = DateTime(_currentYear, _currentMonth, 1);
    return firstDayOfMonth.weekday - 1;
  }

  int _getDaysInMonth() {
    final nextMonth = (_currentMonth < 12)
        ? DateTime(_currentYear, _currentMonth + 1, 1)
        : DateTime(_currentYear + 1, 1, 1);
    return nextMonth.subtract(const Duration(days: 1)).day;
  }

  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
