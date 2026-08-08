import 'package:flutter/material.dart';

import 'stat_card.dart';

class QuickStats extends StatelessWidget {
  const QuickStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.school_rounded,
                value: "4h 20m",
                title: "Study",
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: StatCard(
                icon: Icons.fitness_center,
                value: "Done",
                title: "Workout",
                color: Colors.green,
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.local_fire_department,
                value: "18",
                title: "Streak",
                color: Colors.orange,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: StatCard(
                icon: Icons.track_changes,
                value: "7 / 8",
                title: "Habits",
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }
}