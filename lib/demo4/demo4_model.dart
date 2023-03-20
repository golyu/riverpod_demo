part of '../model/models.dart';

//`@freezed` 是一个代码生成器，它允许您根据 `union` 和 `class` 创建不可变模型。
// 您只需要编写 `class`，然后运行 `freezed`
@freezed
class Todo4 with _$Todo4 {
  factory Todo4({
    required String id,
    required String description,
    required bool isComplete,
  }) = _Todo4;
}

@riverpod
class Todo4s extends _$Todo4s {
  @override
  List<Todo4> build() => [];

  //添加一个todo4
  void addTodo4(Todo4 todo) {
    state = [...state, todo];
  }

  //删除一个todo4
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