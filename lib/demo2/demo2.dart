import 'package:demo/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


demo2() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todo> todos = ref.watch(completeTodosProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('第二个')),
        body: Consumer(builder: (context, ref, child) {
          final List<Todo> todos = ref.watch(completeTodosProvider);
          return ListView(
            children: todos
                .map(
                  (todo) => ListTile(
                    title: Text(todo.description),
                  ),
                )
                .toList(),
          );
        }),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            ref.read(todosProvider.notifier).addTodo(
                  Todo(
                    'Todo ${todos.length + 1}',
                    true,
                  ),
                );
          },
          child: const Text('添加Todo'),
        ),
      ),
    );
  }
}
