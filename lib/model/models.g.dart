// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloWorldHash() => r'dc6ae362ee799629d140a8b35f588087da98346f';

/// See also [helloWorld].
@ProviderFor(helloWorld)
final helloWorldProvider = AutoDisposeProvider<String>.internal(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloWorldRef = AutoDisposeProviderRef<String>;
String _$completeTodosHash() => r'bd128095569a3ec6c0f1bed42160554343c85165';

/// See also [completeTodos].
@ProviderFor(completeTodos)
final completeTodosProvider = AutoDisposeProvider<List<Todo>>.internal(
  completeTodos,
  name: r'completeTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completeTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompleteTodosRef = AutoDisposeProviderRef<List<Todo>>;
String _$canGoToPreviousPageHash() =>
    r'801fe8182a37cd21ae83bdfccbe36c125b4d14fb';

/// See also [canGoToPreviousPage].
@ProviderFor(canGoToPreviousPage)
final canGoToPreviousPageProvider = AutoDisposeProvider<bool>.internal(
  canGoToPreviousPage,
  name: r'canGoToPreviousPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canGoToPreviousPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanGoToPreviousPageRef = AutoDisposeProviderRef<bool>;
String _$todosHash() => r'48f6b84172ad39041804cf38886f8930a4cd8a98';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider = AutoDisposeNotifierProvider<Todos, List<Todo>>.internal(
  Todos.new,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todos = AutoDisposeNotifier<List<Todo>>;
String _$pageIndexHash() => r'd03be1a918d9d391201ac01bc9be2f94c6e14ead';

/// See also [PageIndex].
@ProviderFor(PageIndex)
final pageIndexProvider = AutoDisposeNotifierProvider<PageIndex, int>.internal(
  PageIndex.new,
  name: r'pageIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pageIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PageIndex = AutoDisposeNotifier<int>;
String _$todo4sHash() => r'3c1b9c7c35fa64932ef9545a58a8b94a0f409885';

/// See also [Todo4s].
@ProviderFor(Todo4s)
final todo4sProvider =
    AutoDisposeNotifierProvider<Todo4s, List<Todo4>>.internal(
  Todo4s.new,
  name: r'todo4sProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todo4sHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todo4s = AutoDisposeNotifier<List<Todo4>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
