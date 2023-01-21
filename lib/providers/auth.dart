import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter_app/models/user.dart';
import 'package:todolist_flutter_app/services/firebase/auth.dart';

class AuthState {
  AppUser? user;

  AuthState({required this.user});
}

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth;
  final AuthState state = AuthState(user: null);

  AuthController(this._auth) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        state.user = AppUser.fromFirebaseUser(user);
        notifyListeners();
      } else {
        state.user = null;
        notifyListeners();
      }
    });
  }

  Future<void> signIn({required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

final authProvider = ChangeNotifierProvider<AuthController>(((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthController(auth);
}));
