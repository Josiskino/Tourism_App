import 'package:flutter/material.dart';

import 'activity_stats_card.dart';

class StatsCardsRow extends StatelessWidget {
  const StatsCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActivityStatsCard(
            title: 'Excursions',
            count: '12',
            icon: Icons.hiking,
            gradientColors: const [
              Color(0xFFE6F7E9),
              Color(0xFFE3E9F3),
            ],
            iconBackgroundColor: Colors.green[100]!,
            iconColor: Colors.green,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ActivityStatsCard(
            title: 'Tourist Sites',
            count: '8',
            icon: Icons.location_city,
            gradientColors: const [
              Color(0xFFFFE0B2),
              Color(0xFFF8F3F7),
            ],
            iconBackgroundColor: Colors.orange[100]!,
            iconColor: Color(0xFFDA6F0B),
          ),
        ),
      ],
    );
  }
}
