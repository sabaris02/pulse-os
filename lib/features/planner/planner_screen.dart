import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/planner_provider.dart';
import 'widgets/add_task_dialog.dart';
import 'widgets/calendar_strip.dart';
import 'widgets/task_tile.dart';

class PlannerScreen extends ConsumerStatefulWidget {
  const PlannerScreen({super.key});

  @override
  ConsumerState<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends ConsumerState<PlannerScreen> {
  DateTime _selectedDate = DateTime.now();

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final allTasks = ref.watch(plannerProvider);
    final tasks = allTasks
        .where((task) => _isSameDay(task.date, _selectedDate))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF5A5F),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTaskDialog(date: _selectedDate),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Planner",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            CalendarStrip(
              selectedDate: _selectedDate,
              onDateSelected: (date) {
                setState(() => _selectedDate = date);
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks for this day",
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(task: tasks[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}