


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/presentation/bloc/notifications/notifications_bloc.dart';

class DetailsnotificationScreen extends StatelessWidget {
  final String pushMessageId;
  const DetailsnotificationScreen({super.key, required this.pushMessageId});

  @override
 Widget build(BuildContext context) {
    final PushMessage? pushMessage = context.watch<NotificationsBloc>()
      .getMessageById(pushMessageId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: (pushMessage != null)
        ? _DetailsView(pushMessage: pushMessage)
        : const Center(child: Text('Notificacion no existe')),
    );
  }
}
class _DetailsView extends StatelessWidget {

  final PushMessage pushMessage;
  const _DetailsView({required this.pushMessage});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          if(pushMessage.imageUrl != null)
            Image.network(pushMessage.imageUrl!),
          const SizedBox(height: 30),
          Text(pushMessage.title, style: textStyle.titleMedium),
          Text(pushMessage.body),
          const Divider(),
          Text(pushMessage.data.toString()),
        ],
      ),
      );
  }
}