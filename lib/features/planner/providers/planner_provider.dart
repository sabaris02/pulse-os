import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_model.dart';

class PlannerNotifier extends StateNotifier<List<TaskModel>> {
  PlannerNotifier() : super([]);

  void addTask(TaskModel task) {
    state = [...state, task];
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }

  void toggleTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(
          completed: !task.completed,
        );
      }
      return task;
    }).toList();
  }

  void updateTask(TaskModel updatedTask) {
    state = state.map((task) {
      if (task.id == updatedTask.id) {
        return updatedTask;
      }
      return task;
    }).toList();
  }

  void clearTasks() {
    state = [];
  }
}

final plannerProvider =
    StateNotifierProvider<PlannerNotifier, List<TaskModel>>(
  (ref) => PlannerNotifier(),
);