import 'package:demo/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//现在我们定义一个NotifierProvider，我们可以使用它来与UI中的待办清单列表交互：
class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo4> todos = ref.watch(todo4sProvider);
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.isComplete,
            onChanged: (value) {
              ref.read(todo4sProvider.notifier).updateTodoById(todo.id);
            },
            title: Text(todo.description),
          ),
      ],
    );
  }
}

void demo4() {
  runApp(const ProviderScope(child: MaterialApp(home: NewWidget())));
}

class NewWidget extends ConsumerWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const TodoListView(),
      floatingActionButton: ElevatedButton(
        child: const Text('添加一个todo'),
        onPressed: () {
          ref.read(todo4sProvider.notifier).addTodo4(
                Todo4(
                  id: DateTime.now().toString(),
                  description: '这是一个todo',
                  isComplete: false,
                ),
              );
        },
      ),
    );
  }
}
