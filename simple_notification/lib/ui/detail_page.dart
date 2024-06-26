import 'package:flutter/material.dart';
import 'package:simple_notification/utils/received_notification.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  static const routeName = '/detail_page';

  @override
  Widget build(BuildContext context) {
    final ReceivedNotification arg =
        ModalRoute.of(context)?.settings.arguments as ReceivedNotification;
    return Scaffold(
      appBar: AppBar(
        title: Text('Title: ${arg.payload}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Detal extends StatelessWidget {
  const Detal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
