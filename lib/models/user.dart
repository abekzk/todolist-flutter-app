import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class AppUser {
  final String id;
  final String? name;
  final String? email;

  const AppUser({required this.id, required this.name, required this.email});

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(id: user.uid, name: user.displayName, email: user.email);
  }
}
