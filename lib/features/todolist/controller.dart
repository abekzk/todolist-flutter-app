import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter_app/models/task.dart';
import 'package:todolist_flutter_app/services/api/task.dart';

// state
final todoListStateTasks = FutureProvider.autoDispose((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return taskRepository.fetchTasks();
});

// controller
class TodoListController {
  final Ref ref;
  final TaskRepository taskRepository;

  TodoListController({required this.ref, required this.taskRepository});

  toggleTaskStatus(Task task) async {
    TaskStatus newStatus =
        task.status == TaskStatus.todo ? TaskStatus.done : TaskStatus.todo;
    await taskRepository.updateTask(task.copyWith(status: newStatus));
    var _ = ref.refresh(todoListStateTasks);
  }
}

final todoListControllerProvider = Provider(((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return TodoListController(ref: ref, taskRepository: taskRepository);
}));
