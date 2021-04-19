// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PersonTearOff {
  const _$PersonTearOff();

  _Person call(
      {required int id,
      required String name,
      required int age,
      int? statusCode}) {
    return _Person(
      id: id,
      name: name,
      age: age,
      statusCode: statusCode,
    );
  }

  _Loading loading({int? statusCode}) {
    return _Loading(
      statusCode: statusCode,
    );
  }

  _Error error(String message, {int? statusCode}) {
    return _Error(
      message,
      statusCode: statusCode,
    );
  }
}

/// @nodoc
const $Person = _$PersonTearOff();

/// @nodoc
mixin _$Person {
  int? get statusCode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode) $default, {
    required TResult Function(int? statusCode) loading,
    required TResult Function(String message, int? statusCode) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode)? $default, {
    TResult Function(int? statusCode)? loading,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Person value) $default, {
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Person value)? $default, {
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res>;
  $Res call({int? statusCode});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res> implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  final Person _value;
  // ignore: unused_field
  final $Res Function(Person) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$PersonCopyWith(_Person value, $Res Function(_Person) then) =
      __$PersonCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int age, int? statusCode});
}

/// @nodoc
class __$PersonCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements _$PersonCopyWith<$Res> {
  __$PersonCopyWithImpl(_Person _value, $Res Function(_Person) _then)
      : super(_value, (v) => _then(v as _Person));

  @override
  _Person get _value => super._value as _Person;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_Person(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
class _$_Person implements _Person {
  _$_Person(
      {required this.id,
      required this.name,
      required this.age,
      this.statusCode});

  @override
  final int id;
  @override
  final String name;
  @override
  final int age;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'Person(id: $id, name: $name, age: $age, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Person &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(statusCode);

  @JsonKey(ignore: true)
  @override
  _$PersonCopyWith<_Person> get copyWith =>
      __$PersonCopyWithImpl<_Person>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode) $default, {
    required TResult Function(int? statusCode) loading,
    required TResult Function(String message, int? statusCode) error,
  }) {
    return $default(id, name, age, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode)? $default, {
    TResult Function(int? statusCode)? loading,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, age, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Person value) $default, {
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Person value)? $default, {
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _Person implements Person {
  factory _Person(
      {required int id,
      required String name,
      required int age,
      int? statusCode}) = _$_Person;

  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PersonCopyWith<_Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({int? statusCode});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(_Loading(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
class _$_Loading implements _Loading {
  _$_Loading({this.statusCode});

  @override
  final int? statusCode;

  @override
  String toString() {
    return 'Person.loading(statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(statusCode);

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode) $default, {
    required TResult Function(int? statusCode) loading,
    required TResult Function(String message, int? statusCode) error,
  }) {
    return loading(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode)? $default, {
    TResult Function(int? statusCode)? loading,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Person value) $default, {
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Person value)? $default, {
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements Person {
  factory _Loading({int? statusCode}) = _$_Loading;

  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
class _$_Error implements _Error {
  _$_Error(this.message, {this.statusCode});

  @override
  final String message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'Person.error(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(statusCode);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode) $default, {
    required TResult Function(int? statusCode) loading,
    required TResult Function(String message, int? statusCode) error,
  }) {
    return error(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name, int age, int? statusCode)? $default, {
    TResult Function(int? statusCode)? loading,
    TResult Function(String message, int? statusCode)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Person value) $default, {
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Person value)? $default, {
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements Person {
  factory _Error(String message, {int? statusCode}) = _$_Error;

  String get message => throw _privateConstructorUsedError;
  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
