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