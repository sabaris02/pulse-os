import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final String currentPath;

  const Sidebar({super.key, required this.currentPath});

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
          _item(context, Icons.dashboard, "Dashboard", '/dashboard'),
          _item(context, Icons.calendar_month, "Planner", '/planner'),
          _item(context, Icons.school, "Study", '/study'),
          _item(context, Icons.fitness_center, "Workout", '/workout'),
          _item(context, Icons.local_fire_department, "Habits", '/habits'),
          _item(context, Icons.notes, "Notes", '/notes'),
          _item(context, Icons.bar_chart, "Analytics", '/analytics'),
          _item(context, Icons.settings, "Settings", '/settings'),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context,
    IconData icon,
    String title,
    String path,
  ) {
    final bool selected = currentPath == path;

    return GestureDetector(
      onTap: () {
        if (!selected) context.go(path);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFF4D4D) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(title, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}