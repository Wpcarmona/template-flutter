import 'package:app_template/config/router/app_router_notifier.dart';
import 'package:app_template/presentation/modules/screens.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.watch(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const TabsScreen(),
          routes: []),
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
    ],
    redirect: (context, state) {
      final isGoinTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoinTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }
      if (authStatus == AuthStatus.chekingOTp ||
          authStatus == AuthStatus.chekingType) {
        if (isGoinTo == '/auth/login' || isGoinTo == '/auth/register') {
          return null;
        }
        return '/auth/login';
      }
      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoinTo == '/auth/login' ||
            isGoinTo == '/auth/register' ||
            isGoinTo == '/auth/reset-password') {
          return null;
        }
        return '/auth/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoinTo == '/auth/login' ||
            isGoinTo == '/auth/register' ||
            isGoinTo == '/splash') {
          return '/';
        }
      }
      return null;
    },
  );
});
