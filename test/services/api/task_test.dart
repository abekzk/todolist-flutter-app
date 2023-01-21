import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist_flutter_app/models/task.dart';
import 'package:todolist_flutter_app/services/api/task.dart';

import 'task_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late http.Client client;
  late TaskRepository taskRepository;

  const baseURL = 'http://example.com';

  setUp((() {
    client = MockClient();
    taskRepository = TaskRepository(baseURL: baseURL, client: client);
  }));

  group('fetchTasks', (() {
    test('正常レスポンスの場合にすべてのタスクを取得できること', (() async {
      when(client.get(Uri.parse('$baseURL/v1/tasks'))).thenAnswer((_) async =>
          http.Response(
              '[{"id": "id1","user_id": "user_1","title": "title_1","description": "description_1","status": 0}]',
              200));
      expect(await taskRepository.fetchTasks(), isA<Tasks>());
    }));
  }));
}
