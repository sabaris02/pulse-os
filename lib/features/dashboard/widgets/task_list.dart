import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/app_card.dart';
import '../../planner/providers/planner_provider.dart';
import 'task_item.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(plannerProvider);
    final today = DateTime.now();
    final todaysTasks =
        allTasks.where((task) => _isSameDay(task.date, today)).toList();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Tasks",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          if (todaysTasks.isEmpty)
            const Text(
              "No tasks for today",
              style: TextStyle(color: Colors.white54),
            )
          else
            ...todaysTasks.map(
              (task) => TaskItem(
                title: task.title,
                completed: task.completed,
                onTap: () {
                  ref.read(plannerProvider.notifier).toggleTask(task.id);
                },
              ),
            ),
        ],
      ),
    );
  }
}