part of '../model/models.dart';

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