import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab section with 'All'
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: const Text(
                  'All',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.grey[200],
                padding: const EdgeInsets.symmetric(
                  vertical: 7.0,
                  horizontal: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 2,
                  ),
                ),
                avatar: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.check,
                    color: Colors.blueAccent,
                  ),
                ),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // Body of the notification list (currently empty)
          const Expanded(
            child: Center(
              child: Text('No notifications available'),
            ),
          ),
        ],
      ),
    );
  }
}
