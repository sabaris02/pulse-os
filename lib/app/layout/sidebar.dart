import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: const Color(0xFF18181B),
      child: Column(
        children: [
          const SizedBox(height: 40),

          const Icon(
            Icons.bolt,
            color: Color(0xFFFF4D4D),
            size: 42,
          ),

          const SizedBox(height: 16),

          const Text(
            "Pulse OS",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          _item(Icons.dashboard, "Dashboard", true),
          _item(Icons.calendar_month, "Planner"),
          _item(Icons.school, "Study"),
          _item(Icons.fitness_center, "Workout"),
          _item(Icons.local_fire_department, "Habits"),
          _item(Icons.notes, "Notes"),
          _item(Icons.bar_chart, "Analytics"),
          _item(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  Widget _item(
    IconData icon,
    String title, [
    bool selected = false,
  ]) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFFF4D4D)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}