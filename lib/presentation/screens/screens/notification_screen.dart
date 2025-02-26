

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/presentation/bloc/notifications/notifications_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (NotificationsBloc bloc) => Text('${bloc.state.status}')
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.read<NotificationsBloc>().requestPermission();
            },
          ),
        ],
      ),
      body: const _NotificationView(),
    );
  }
}
class _NotificationView extends StatelessWidget {
  const _NotificationView();

  @override
  Widget build(BuildContext context) {
     final notifications = context.read<NotificationsBloc>().state.notifications;
    
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index){
        final notification = notifications[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.body),
          leading: notification.imageUrl != null
            ? Image.network(notification.imageUrl!)
            : null,
          onTap: () {
            context.push('/push-details/${notification.messageId}');
          },
        );
      }
      );
  }
}