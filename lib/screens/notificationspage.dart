import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: const [
          ListTile(title: Text('Your order has been shipped')),
          ListTile(title: Text('Special weekend discount available')),
        ],
      ),
    );
  }
}