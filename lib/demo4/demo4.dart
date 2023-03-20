import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo4.freezed.dart';

part 'demo4.g.dart';

//`@freezed` 是一个代码生成器，它允许您根据 `union` 和 `class` 创建不可变模型。
// 您只需要编写 `class`，然后运行 `freezed`
@freezed
class Todo with _$Todo {
  factory Todo({
    required String id,
    required String description,
    required bool isComplete,
  }) = _Todo;
}

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() => [];

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

//现在我们定义一个NotifierProvider，我们可以使用它来与UI中的待办清单列表交互：
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
          ref.read(todosProvider.notifier).addTodo(
                Todo(
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
