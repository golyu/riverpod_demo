import 'package:demo/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = Provider<String>((ref) {
  return "hello 2";
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final String value2 = ref.watch(myProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('第一个例子')),
        body: Column(
          children: [
            Center(
              child: Text(value),
            ),
            Center(
              child: Text(value2),
            ),
          ],
        ),
      ),
    );
  }
}

demo1() {
  runApp(const ProviderScope(child: MyApp()));
}
