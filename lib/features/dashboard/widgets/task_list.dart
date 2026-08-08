import 'package:flutter/material.dart';

import '../../../shared/widgets/app_card.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Tasks",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          TaskItem(title: "AZ-900", completed: false),
          TaskItem(title: "Workout", completed: true),
          TaskItem(title: "LeetCode", completed: false),
          TaskItem(title: "German", completed: false),
        ],
      ),
    );
  }
}