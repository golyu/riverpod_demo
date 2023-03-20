import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo5.freezed.dart';

part 'demo5.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required String id,
    required String description,
    required bool isComplete,
  }) = _Todo;

}

@riverpod
class AsyncTodos extends _$AsyncTodos {
  final List<Todo> _todos = [];

  Future<List<Todo>> _fetchTodos() async {
    await Future.delayed(const Duration(seconds: 1));

    if (_todos.isEmpty) {
      _todos.addAll([
        Todo(
          id: '1',
          description: 'Todo 1',
          isComplete: false,
        ),
        Todo(
          id: '2',
          description: 'Todo 2',
          isComplete: false,
        ),
        Todo(
          id: '3',
          description: 'Todo 3',
          isComplete: false,
        ),
      ]);
    }
    return _todos;
  }

  @override
  FutureOr<List<Todo>> build() => _fetchTodos();

  //添加代办事项(异步)
  Future<void> addTodoAsync(Todo todo) async {
    //将当前状态设置为加载中
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));
      //我去
      _todos.add(todo);
      return _fetchTodos();
    });
  }

  //删除代办清单
  Future<void> removeTodo(String todoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));
      _todos.removeWhere((todo) => todo.id == todoId);
      return _fetchTodos();
    });
  }

  //更新代办事项
  Future<void> updateTodoAsync(String todoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));
      _todos.map((todo) {
        if (todo.id == todoId) {
          return todo.copyWith(isComplete: !todo.isComplete);
        } else {
          return todo;
        }
      }).toList();
      return _fetchTodos();
    });
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodos = ref.watch(asyncTodosProvider);
    return asyncTodos.when(
      data: (data) => ListView(
        children: [
          for (final todo in data)
            CheckboxListTile(
              value: todo.isComplete,
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(asyncTodosProvider.notifier)
                      .updateTodoAsync(todo.id);
                }
              },
              title: Text(todo.description),
              secondary: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(asyncTodosProvider.notifier).removeTodo(todo.id);
                },
              ),
            ),
        ],
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

demo5() {
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
              ref.read(asyncTodosProvider.notifier).addTodoAsync(Todo(
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
