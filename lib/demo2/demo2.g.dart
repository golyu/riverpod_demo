// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo2.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
