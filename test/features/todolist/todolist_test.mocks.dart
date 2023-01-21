// Mocks generated by Mockito 5.3.2 from annotations
// in todolist_flutter_app/test/features/todolist/todolist_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todolist_flutter_app/models/task.dart' as _i3;
import 'package:todolist_flutter_app/services/api/task.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTask_1 extends _i1.SmartFake implements _i3.Task {
  _FakeTask_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i4.TaskRepository {
  MockTaskRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);
  @override
  String get baseURL => (super.noSuchMethod(
        Invocation.getter(#baseURL),
        returnValue: '',
      ) as String);
  @override
  _i5.Future<List<_i3.Task>> fetchTasks() => (super.noSuchMethod(
        Invocation.method(
          #fetchTasks,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Task>>.value(<_i3.Task>[]),
      ) as _i5.Future<List<_i3.Task>>);
  @override
  _i5.Future<_i3.Task> updateTask(_i3.Task? task) => (super.noSuchMethod(
        Invocation.method(
          #updateTask,
          [task],
        ),
        returnValue: _i5.Future<_i3.Task>.value(_FakeTask_1(
          this,
          Invocation.method(
            #updateTask,
            [task],
          ),
        )),
      ) as _i5.Future<_i3.Task>);
}
