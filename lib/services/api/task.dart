import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:todolist_flutter_app/models/task.dart';
import 'package:todolist_flutter_app/services/api/client.dart';
import 'package:todolist_flutter_app/services/firebase/auth.dart';

class TaskRepository {
  final http.Client client;
  final String baseURL;

  TaskRepository({required this.client, required this.baseURL});

  Future<Tasks> fetchTasks() async {
    final response = await client.get(
      Uri.parse('$baseURL/v1/tasks'),
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Task>((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  Future<Task> updateTask(Task task) async {
    final response = await client.put(Uri.parse('$baseURL/v1/tasks/${task.id}'),
        body: jsonEncode(task));
    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch task');
    }
  }
}

final taskRepositoryProvider = Provider((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return TaskRepository(
      client: CustomClient(firebaseAuth: auth),
      baseURL: 'http://localhost:8080');
});
