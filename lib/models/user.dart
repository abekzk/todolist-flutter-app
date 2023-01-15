import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String id;
  String? name;
  String? email;

  AppUser({required this.id, required this.name, required this.email});

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(id: user.uid, name: user.displayName, email: user.email);
  }
}
