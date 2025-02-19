import 'package:app_template/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/', builder: (context, state) => const LoginScreen(), routes: []),
  GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
      routes: []),
  GoRoute(
      path: '/auth/register',
      builder: (context, state) => const RegisterScreen(),
      routes: [])
]);
