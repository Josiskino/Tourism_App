import 'package:flutter/material.dart';

import 'widgets/upgrade_section_widget.dart';
import 'widgets/payment_section.dart';
import 'widgets/preference_section_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'SETTINGS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              UpgradeSectionWidget(),
              SizedBox(height: 20),
              PreferenceSectionWidget(),
              SizedBox(height: 20),
              PaymentSection(),
            ],
          ),
        ),
      ),
    );
  }
}
