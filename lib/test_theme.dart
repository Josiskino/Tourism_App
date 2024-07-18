import 'package:flutter/material.dart';

class TestTheme extends StatelessWidget {
  const TestTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),

    );
  }
}