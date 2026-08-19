import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool completed;
  final VoidCallback? onTap;

  const TaskItem({
    super.key,
    required this.title,
    required this.completed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Icon(
        completed ? Icons.check_circle : Icons.radio_button_unchecked,
        color: completed ? Colors.green : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          decoration: completed ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}