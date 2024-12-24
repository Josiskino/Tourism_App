

import 'package:flutter/material.dart';

class ActivityStatsCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final List<Color> gradientColors;
  final Color iconBackgroundColor;
  final Color iconColor;

  const ActivityStatsCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.gradientColors,
    required this.iconBackgroundColor,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 12,
            child: _buildIcon(),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Text(
              count,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
