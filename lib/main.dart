

import 'package:app_template/config/local_notifications/local_notifications.dart';
import 'package:app_template/config/router/app_router.dart';
import 'package:app_template/config/theme/app_theme.dart';
import 'package:app_template/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await dotenv.load(fileName: ".env"); 
  await NotificationsBloc.initializeFCM();
  final container = ProviderContainer();
  final appRouter = container.read(goRouterProvider);
  await LocalNotifications.initializeLocalNotifications(appRouter);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => NotificationsBloc(
            requestLocalNotificationPermissions:
                LocalNotifications.requestPermissionLocalNotifications,
            showLocalNotification: LocalNotifications.showLocalNotification)),
  ], child: const ProviderScope(child: MyApp())));
} 


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'AppTemplate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      builder: (context, child) =>
          HandleNotificationInteractions(child: child!),
    );
  }
}

class HandleNotificationInteractions extends ConsumerStatefulWidget {
  final Widget child;
  const HandleNotificationInteractions({super.key, required this.child});

  @override
  HandleNotificationInteractionsState createState() =>
      HandleNotificationInteractionsState();
}

class HandleNotificationInteractionsState extends ConsumerState<HandleNotificationInteractions> {
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

void _handleMessage(RemoteMessage message) {
  context.read<NotificationsBloc>().handleRemoteMessage(message);

  final messageId = message.messageId?.replaceAll(':', '').replaceAll('%', '');

  Future.microtask(() {
    if (mounted) {
      final router = ref.read(goRouterProvider);
      router.go('/push-details/$messageId');

    }
  });
}

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}