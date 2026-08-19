import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../services/planner_service.dart';

class PlannerNotifier extends StateNotifier<List<TaskModel>> {
  final PlannerService _service = PlannerService();

  PlannerNotifier() : super([]) {
    state = _service.loadTasks();
  }

  void addTask(TaskModel task) {
    state = [...state, task];
    _service.saveTasks(state);
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
    _service.saveTasks(state);
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
    _service.saveTasks(state);
  }

  void updateTask(TaskModel updatedTask) {
    state = state.map((task) {
      if (task.id == updatedTask.id) {
        return updatedTask;
      }
      return task;
    }).toList();
    _service.saveTasks(state);
  }

  void clearTasks() {
    state = [];
    _service.saveTasks(state);
  }
}

final plannerProvider =
    StateNotifierProvider<PlannerNotifier, List<TaskModel>>(
  (ref) => PlannerNotifier(),
);