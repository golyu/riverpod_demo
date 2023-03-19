### 步骤

- 为了让小部件能够读取提供者,根节点加上`ProviderScope`
- 写一个helloWorld函数,使用@riverpod注解
- 给代码加入`part of 'demo1.dart';`,使用快捷键`alt+b`生成代码
- 消费者部件继承ConsumerWidget,重写build方法,使用`re.watch`监听helloWorld函数

> 以上第二步,如果使用`Flutter Riverpod Snippets`插件,直接输入`provider`的live template,就会自动生成无注解的Provider
