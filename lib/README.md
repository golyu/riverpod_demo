#### demo1 讲解riverpod的基本使用

provider一般用于

- 缓存计算。
- 向其他provider(比如Repository/HttpClient)暴露一个值。
- 为测试或widget提供重写值的方法。
- 减少 provider/widget 的重新构建，不必使用 select。

#### demo2 讲解riverpod的进阶使用,通过创建多个Provider,来减少widget的重新构建

#### demo3 也是讲解riverpod的进阶使用,通过创建多个Provider,来减少widget的重新构建

#### demo4 todo的新的定义方式@freezed,NotifierProvider的使用

#### demo5 AsyncNotifierProvider的使用 ,注意,使用的时候,是.when()方法

一般用于

- 暴露在对自定义事件做出反应后可以随时间推移变化的状态。
- 修改某些状态的逻辑(又名“业务逻辑”)集中在一个地方，随着时间的推移也能提高可维护性。

#### demo6 StateNotifierProvider的使用,一个用于监听和公开StateNotifier的provider

一般用于

- 暴露一个`不可变`的状态，在对自定义事件做出反应后可以随时间改变。
- 修改某些状态的逻辑(又名“业务逻辑”)集中在一个地方，随着时间的推移也能提高可维护性。

关键字`@immutable`,用于标记类为不可变的

#### demo7 FutureProvider的使用,一个用于监听和公开Future的provider

一般用于

- 执行和缓存异步操作 (比如网络请求)
- 能很好地处理异步操作中的错误/加载中的状态
- 将多个异步的值组合为另一个异步的值

> FutureProvider 不提供给用户交互后直接修改计算结果的方法。它被设计用来解决简单的用例。
> 对于更高级的场景请考虑使用StateNotifierProvider 。

#### demo8 StreamProvider的使用,类似于 FutureProvider 但用于 Streams 而不是 Futures。

一般用于

- 监听Firebase或web-sockets
- 每隔几秒重建另一个provider

好处

- 它允许其他provider使用 ref.watch 监听流。
- 多亏了 AsyncValue ，它能确保加载和错误情况得到正确处理。
- 它消除了必须区分广播流和普通流的需要。
- 它缓存由流发出的最新值，确保如果在事件发出后添加监听器， 监听器仍然可以立即访问最新的事件。
- 它允许在测试期间通过覆盖`StreamProvider`轻松地模拟流。

#### demo9 StateProvider的使用, StateNotifierProvider 的简化版，旨在避免为非常简单的用例编写 StateNotifier类。

StateProvider 的存在主要是为了允许用户界面对简单的变量进行修改。 所以StateProvider 的状态通常为：

- 枚举类型，例如筛选器类型
- 一段字符串(String)，通常是输入框的原始内容
- 用于复选框的布尔类型
- 用于分页或年龄表单字段的数字

不应该使用 StateProvider 如果：

- 你的状态需要验证逻辑
- 你的状态是一个复杂的对象 (比如自定义的类, 集合……)
- 修改状态的逻辑比简单的 count++ 更复杂

#### ChangeNotifierProvider ,不推荐使用,所以没有写示例

```dart

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
```

#### ref.listen
可以在provider内部使用,也可以在 build 方法中
类似于vue的watch ,ref.watch 类似于vue的computed

与 ref.watch 类似，也可以使用ref.listen来观察一个provider,它们之间的主要区别是，
如果监听的provider发生更改， 使用 ref.listen 将调用自定义的函数，而不是重新构建widget/provider。

#### 注意

watch 方法不应该被异步调用。 它也不应该在 initState 和其他 State 的生命周期中使用。
在这种情况下，请考虑使用 ref.read。

