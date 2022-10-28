import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter_app/features/todolist/todolist.dart';
import 'package:todolist_flutter_app/screens/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              actions: <Widget>[
                TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: const Text('ログアウト'))
              ],
            ),
            body: const TodoListView(),
          );
        }
        return const LoginScreen();
      },
    );
  }
}
