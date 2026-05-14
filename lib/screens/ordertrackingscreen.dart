import 'package:flutter/material.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order #20394', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Processing → Shipped → Delivered'),
          ],
        ),
      ),
    );
  }
}