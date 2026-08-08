import 'package:flutter/material.dart';

import 'widgets/dashboard_header.dart';
import 'widgets/mission_card.dart';
import 'widgets/quick_stats.dart';
import 'widgets/task_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DashboardHeader(),

            SizedBox(height: 32),

            MissionCard(),

            SizedBox(height: 30),

            QuickStats(),

            SizedBox(height: 30),

            TaskList(),
          ],
        ),
      ),
    );
  }
}