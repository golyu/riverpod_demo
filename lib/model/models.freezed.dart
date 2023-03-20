// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Todo4 {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Todo4CopyWith<Todo4> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Todo4CopyWith<$Res> {
  factory $Todo4CopyWith(Todo4 value, $Res Function(Todo4) then) =
      _$Todo4CopyWithImpl<$Res, Todo4>;
  @useResult
  $Res call({String id, String description, bool isComplete});
}

/// @nodoc
class _$Todo4CopyWithImpl<$Res, $Val extends Todo4>
    implements $Todo4CopyWith<$Res> {
  _$Todo4CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? isComplete = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Todo4CopyWith<$Res> implements $Todo4CopyWith<$Res> {
  factory _$$_Todo4CopyWith(_$_Todo4 value, $Res Function(_$_Todo4) then) =
      __$$_Todo4CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String description, bool isComplete});
}

/// @nodoc
class __$$_Todo4CopyWithImpl<$Res> extends _$Todo4CopyWithImpl<$Res, _$_Todo4>
    implements _$$_Todo4CopyWith<$Res> {
  __$$_Todo4CopyWithImpl(_$_Todo4 _value, $Res Function(_$_Todo4) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? isComplete = null,
  }) {
    return _then(_$_Todo4(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Todo4 implements _Todo4 {
  _$_Todo4(
      {required this.id, required this.description, required this.isComplete});

  @override
  final String id;
  @override
  final String description;
  @override
  final bool isComplete;

  @override
  String toString() {
    return 'Todo4(id: $id, description: $description, isComplete: $isComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo4 &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, description, isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Todo4CopyWith<_$_Todo4> get copyWith =>
      __$$_Todo4CopyWithImpl<_$_Todo4>(this, _$identity);
}

abstract class _Todo4 implements Todo4 {
  factory _Todo4(
      {required final String id,
      required final String description,
      required final bool isComplete}) = _$_Todo4;

  @override
  String get id;
  @override
  String get description;
  @override
  bool get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$_Todo4CopyWith<_$_Todo4> get copyWith =>
      throw _privateConstructorUsedError;
}
