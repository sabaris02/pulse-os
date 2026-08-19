import 'package:hive/hive.dart';

import '../models/task_model.dart';

class PlannerService {
  Box get _box => Hive.box('planner_tasks');

  List<TaskModel> loadTasks() {
    final raw = _box.get('tasks', defaultValue: <dynamic>[]) as List;
    return raw
        .map((item) => TaskModel.fromMap(Map<String, dynamic>.from(item)))
        .toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final raw = tasks.map((task) => task.toMap()).toList();
    await _box.put('tasks', raw);
  }
}