import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo2.g.dart';

//代办事项对象
class Todo {
  final String description;
  final bool isComplete;

  Todo(this.description, this.isComplete);
}

//代办事项列表
@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() => [];

  void addTodo(Todo todo) {
    state = [...state, todo];
  }
}

//返回完成的待办事项
@riverpod
List<Todo> completeTodos(CompleteTodosRef ref) {
  final todos = ref.watch(todosProvider);
  // 我们只返回完成的待办事项
  return todos.where((todo) => todo.isComplete).toList();
}

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
