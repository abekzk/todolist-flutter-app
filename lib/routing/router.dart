import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_flutter_app/providers/auth.dart';
import 'package:todolist_flutter_app/screens/home.dart';
import 'package:todolist_flutter_app/screens/login.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);
  return GoRouter(
      initialLocation: HomeScreen.routeName,
      routes: <RouteBase>[
        GoRoute(
            path: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen()),
        GoRoute(
            path: LoginScreen.routeName,
            builder: (context, state) => const LoginScreen())
      ],
      redirect: (context, state) {
        if (authStateChanges.isLoading || authStateChanges.hasError)
          return null;
        final isAuth = authStateChanges.valueOrNull != null;
        if (isAuth) {
          return null;
        } else {
          return LoginScreen.routeName;
        }
      });
});
