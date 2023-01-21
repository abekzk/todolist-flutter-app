import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter_app/providers/auth.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'メールアドレス',
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'パスワード',
              ),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final credential = await ref
                      .read(authProvider.notifier)
                      .signIn(email: email, password: password);
                } on FirebaseAuthException catch (e) {
                  print(e);
                }
              },
              child: const Text('ENTER'),
            )
          ],
        ),
      ),
    );
  }
}
