import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Todo {
  final String id;
  final String description;
  final bool isComplete;

  const Todo({
    required this.id,
    required this.description,
    required this.isComplete,
  });

  Todo copyWith({
    String? id,
    String? description,
    bool? isComplete,
  }) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, description: $description, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.description == description &&
        other.isComplete == isComplete;
  }

  @override
  int get hashCode {
    return id.hashCode ^ description.hashCode ^ isComplete.hashCode;
  }
}

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  //添加一个todo
  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  //删除一个todo
  void removeTodoById(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  //更新一个todo,将指定清单标记为已完成或未完成
  void updateTodoById(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        //复制是因为我们的状态是不可变的，所以我们需要创建待办清单的副本
        return todo.copyWith(isComplete: !todo.isComplete);
      } else {
        return todo;
      }
    }).toList();
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>(
  (ref) {
    return TodosNotifier();
  },
);

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.isComplete,
            onChanged: (value) {
              ref.read(todosProvider.notifier).updateTodoById(todo.id);
            },
            title: Text(todo.description),
            secondary: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(todosProvider.notifier).removeTodoById(todo.id);
              },
            ),
          ),
      ],
    );
  }
}

demo6() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: Consumer(builder: (context, ref, child) {
        var index = 666;
        return Scaffold(
          body: const TodoListView(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              index++;
              ref.read(todosProvider.notifier).addTodo(Todo(
                id: index.toString(),
                description: 'Todo $index',
                isComplete: false,
              ));
            },
          ),
        );
      }),
    ),
  ));
}
