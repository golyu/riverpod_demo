### 步骤

- 创建Todo对象

- 创建一个Todos对象, 用来管理Todo对象列表
- 给Todos对象@riverpod注解,继承_$Todos,实现build方法
- 给代码加入`part of 'demo2.dart';`,使用快捷键`alt+b`生成代码
- 然后给Todos对象加上addTodo方法

- 创建一个经过筛选的代办清单列表
- 给函数completedTodos加上@riverpod注解,接收参数`CompletedTodosRef ref`
- 返回完成的代办事项列表`todos.where((todo) => todo.isCompleted).toList()`
- 然后在组件中可以消费这个Riverpod(指completedTodos)
- `Consumer(builder: (context, ref, child){}`

Provider 独特的地方在于，就算在重新计算 Provider 时(通常在使用ref.watch时)，
它也不会更新监听它的widget/provider，除非当中的值发生了变化。有点类似于vue,react的虚拟dom算法