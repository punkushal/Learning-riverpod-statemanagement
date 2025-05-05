import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoNotifier extends StateNotifier<List<String>> {
  TodoNotifier() : super([]);

  void addTask(String taskName) {
    state = [...state, taskName];
  }

  void removeTask(int index) {
    final updated = [...state]..removeAt(index);
    state = updated;
  }
}

final todoNotifierProvider = StateNotifierProvider<TodoNotifier, List<String>>((
  ref,
) {
  return TodoNotifier();
});
