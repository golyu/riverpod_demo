import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo7.g.dart';

class Configuration {
  final String title;
  final String subtitle;

  Configuration({
    required this.title,
    required this.subtitle,
  });
}

@riverpod
Future<Configuration> fetchConfiguration(FetchConfigurationRef ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return Configuration(
    title: 'H???????',
    subtitle: 'This is a subtitle',
  );
}

demo7() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: Consumer(builder: (context, ref, child) {
        final config = ref.watch(fetchConfigurationProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text('FutureProvider'),
          ),
          body: config.when(
              data: (config) {
                return Text(config.title);
              },
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator()),
          floatingActionButton: const Icon(Icons.add),
        );
      }),
    ),
  ));
}
