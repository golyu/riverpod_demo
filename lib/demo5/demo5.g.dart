// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo5.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as String,
      description: json['description'] as String,
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'isComplete': instance.isComplete,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncTodosHash() => r'47cfd9354152dfd095b548796b8f8be96763fae2';

/// See also [AsyncTodos].
@ProviderFor(AsyncTodos)
final asyncTodosProvider =
    AutoDisposeAsyncNotifierProvider<AsyncTodos, List<Todo>>.internal(
  AsyncTodos.new,
  name: r'asyncTodosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$asyncTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncTodos = AutoDisposeAsyncNotifier<List<Todo>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
