import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_mgmt_learning/providers/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final todos = ref.watch(todoNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('My Tasks'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'Enter your task'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref
                          .read(todoNotifierProvider.notifier)
                          .addTask(controller.text.trim());
                      controller.clear();
                    }
                  },
                  child: Text('Add Task'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(todoNotifierProvider.notifier)
                              .removeTask(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
