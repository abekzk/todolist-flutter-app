import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter_app/features/todolist/todolist.dart';
import 'package:todolist_flutter_app/providers/auth.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: <Widget>[
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () async {
                await ref.read(authProvider.notifier).signOut();
              },
              child: const Text('ログアウト'))
        ],
      ),
      body: const TodoListView(),
    );
  }
}
