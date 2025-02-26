import 'package:app_template/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/', builder: (context, state) => const TabsScreen(), routes: []),
  GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
      routes: []),
  GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationScreen(),
      routes: []),
  GoRoute(
    path: '/push-details/:messageId',
    builder: (context, state) => DetailsnotificationScreen(
        pushMessageId: state.pathParameters['messageId'] ?? ''),
  ),
  GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
      routes: []),
  GoRoute(
      path: '/auth/register',
      builder: (context, state) => const RegisterScreen(),
      routes: []),
  GoRoute(
      path: '/auth/reset-password',
      builder: (context, state) => const ResetPasswordScreen(),
      routes: [])
]);
