import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = StreamProvider<List<String>>((ref) async* {
  final socket = await Socket.connect('localhost', 3000);
  ref.onDispose(socket.close);
  var allMessages = <String>[];
  await for (final message in socket.map(utf8.decode)) {
    //已收到一条新消息。让我们将它添加到所有消息的列表中。
    allMessages = [...allMessages, message];
    yield allMessages;
  }
});

class ChatWidget extends ConsumerWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveChats = ref.watch(chatProvider);
    return liveChats.when(
      loading: () => const CircularProgressIndicator(),
      data: (List<String> messages) {
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ListTile(
              title: Text(message),
            );
          },
        );
      },
      error: (err, stackTrace) => Text(err.toString()),
    );
  }
}
