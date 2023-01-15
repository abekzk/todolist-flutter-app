import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter_app/features/todolist/controller.dart';
import 'package:todolist_flutter_app/models/task.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scrollbar(
        child: ref.watch(todoListStateTasks).when(
            data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  final task = data[index];
                  return ListTile(
                      leading: Icon(task.status == TaskStatus.todo
                          ? Icons.circle_outlined
                          : Icons.check_circle),
                      title: Text(task.title),
                      onTap: () => ref
                          .read(todoListControllerProvider)
                          .toggleTaskStatus(task));
                })),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: ((error, stackTrace) =>
                Center(child: Text(error.toString())))));
  }
}
