import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist_flutter_app/features/todolist/todolist.dart';
import 'package:todolist_flutter_app/models/task.dart';
import 'package:todolist_flutter_app/services/api/task.dart';

import 'todolist_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  testWidgets('TodoList', (widgetTester) async {
    final repository = MockTaskRepository();
    when(repository.fetchTasks()).thenAnswer((realInvocation) async => [
          Task(
              id: 'id1',
              title: 'title_1',
              description: 'description_1',
              status: TaskStatus.todo)
        ]);
    await widgetTester.pumpWidget(ProviderScope(
        overrides: [taskRepositoryProvider.overrideWithValue(repository)],
        child: const MaterialApp(home: Scaffold(body: TodoListView()))));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await widgetTester.pump();
    expect(find.text('title_1'), findsOneWidget);
  });
}
