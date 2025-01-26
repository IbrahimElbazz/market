// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingRegister,
    required TResult Function() successRegister,
    required TResult Function(String errorMessage) errorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingRegister,
    TResult? Function()? successRegister,
    TResult? Function(String errorMessage)? errorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingRegister,
    TResult Function()? successRegister,
    TResult Function(String errorMessage)? errorRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingRegister value) loadingRegister,
    required TResult Function(SuccessRegister value) successRegister,
    required TResult Function(ErrorRegister value) errorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingRegister value)? loadingRegister,
    TResult? Function(SuccessRegister value)? successRegister,
    TResult? Function(ErrorRegister value)? errorRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingRegister value)? loadingRegister,
    TResult Function(SuccessRegister value)? successRegister,
    TResult Function(ErrorRegister value)? errorRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingRegister,
    required TResult Function() successRegister,
    required TResult Function(String errorMessage) errorRegister,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingRegister,
    TResult? Function()? successRegister,
    TResult? Function(String errorMessage)? errorRegister,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingRegister,
    TResult Function()? successRegister,
    TResult Function(String errorMessage)? errorRegister,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingRegister value) loadingRegister,
    required TResult Function(SuccessRegister value) successRegister,
    required TResult Function(ErrorRegister value) errorRegister,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingRegister value)? loadingRegister,
    TResult? Function(SuccessRegister value)? successRegister,
    TResult? Function(ErrorRegister value)? errorRegister,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingRegister value)? loadingRegister,
    TResult Function(SuccessRegister value)? successRegister,
    TResult Function(ErrorRegister value)? errorRegister,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingRegisterImplCopyWith<$Res> {
  factory _$$LoadingRegisterImplCopyWith(_$LoadingRegisterImpl value,
          $Res Function(_$LoadingRegisterImpl) then) =
      __$$LoadingRegisterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRegisterImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$LoadingRegisterImpl>
    implements _$$LoadingRegisterImplCopyWith<$Res> {
  __$$LoadingRegisterImplCopyWithImpl(
      _$LoadingRegisterImpl _value, $Res Function(_$LoadingRegisterImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingRegisterImpl implements LoadingRegister {
  const _$LoadingRegisterImpl();

  @override
  String toString() {
    return 'RegisterState.loadingRegister()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingRegisterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingRegister,
    required TResult Function() successRegister,
    required TResult Function(String errorMessage) errorRegister,
  }) {
    return loadingRegister();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingRegister,
    TResult? Function()? successRegister,
    TResult? Function(String errorMessage)? errorRegister,
  }) {
    return loadingRegister?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingRegister,
    TResult Function()? successRegister,
    TResult Function(String errorMessage)? errorRegister,
    required TResult orElse(),
  }) {
    if (loadingRegister != null) {
      return loadingRegister();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingRegister value) loadingRegister,
    required TResult Function(SuccessRegister value) successRegister,
    required TResult Function(ErrorRegister value) errorRegister,
  }) {
    return loadingRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingRegister value)? loadingRegister,
    TResult? Function(SuccessRegister value)? successRegister,
    TResult? Function(ErrorRegister value)? errorRegister,
  }) {
    return loadingRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingRegister value)? loadingRegister,
    TResult Function(SuccessRegister value)? successRegister,
    TResult Function(ErrorRegister value)? errorRegister,
    required TResult orElse(),
  }) {
    if (loadingRegister != null) {
      return loadingRegister(this);
    }
    return orElse();
  }
}

abstract class LoadingRegister implements RegisterState {
  const factory LoadingRegister() = _$LoadingRegisterImpl;
}

/// @nodoc
abstract class _$$SuccessRegisterImplCopyWith<$Res> {
  factory _$$SuccessRegisterImplCopyWith(_$SuccessRegisterImpl value,
          $Res Function(_$SuccessRegisterImpl) then) =
      __$$SuccessRegisterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessRegisterImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$SuccessRegisterImpl>
    implements _$$SuccessRegisterImplCopyWith<$Res> {
  __$$SuccessRegisterImplCopyWithImpl(
      _$SuccessRegisterImpl _value, $Res Function(_$SuccessRegisterImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessRegisterImpl implements SuccessRegister {
  const _$SuccessRegisterImpl();

  @override
  String toString() {
    return 'RegisterState.successRegister()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessRegisterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingRegister,
    required TResult Function() successRegister,
    required TResult Function(String errorMessage) errorRegister,
  }) {
    return successRegister();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingRegister,
    TResult? Function()? successRegister,
    TResult? Function(String errorMessage)? errorRegister,
  }) {
    return successRegister?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingRegister,
    TResult Function()? successRegister,
    TResult Function(String errorMessage)? errorRegister,
    required TResult orElse(),
  }) {
    if (successRegister != null) {
      return successRegister();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingRegister value) loadingRegister,
    required TResult Function(SuccessRegister value) successRegister,
    required TResult Function(ErrorRegister value) errorRegister,
  }) {
    return successRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingRegister value)? loadingRegister,
    TResult? Function(SuccessRegister value)? successRegister,
    TResult? Function(ErrorRegister value)? errorRegister,
  }) {
    return successRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingRegister value)? loadingRegister,
    TResult Function(SuccessRegister value)? successRegister,
    TResult Function(ErrorRegister value)? errorRegister,
    required TResult orElse(),
  }) {
    if (successRegister != null) {
      return successRegister(this);
    }
    return orElse();
  }
}

abstract class SuccessRegister implements RegisterState {
  const factory SuccessRegister() = _$SuccessRegisterImpl;
}

/// @nodoc
abstract class _$$ErrorRegisterImplCopyWith<$Res> {
  factory _$$ErrorRegisterImplCopyWith(
          _$ErrorRegisterImpl value, $Res Function(_$ErrorRegisterImpl) then) =
      __$$ErrorRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorRegisterImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$ErrorRegisterImpl>
    implements _$$ErrorRegisterImplCopyWith<$Res> {
  __$$ErrorRegisterImplCopyWithImpl(
      _$ErrorRegisterImpl _value, $Res Function(_$ErrorRegisterImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorRegisterImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorRegisterImpl implements ErrorRegister {
  const _$ErrorRegisterImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RegisterState.errorRegister(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorRegisterImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorRegisterImplCopyWith<_$ErrorRegisterImpl> get copyWith =>
      __$$ErrorRegisterImplCopyWithImpl<_$ErrorRegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingRegister,
    required TResult Function() successRegister,
    required TResult Function(String errorMessage) errorRegister,
  }) {
    return errorRegister(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingRegister,
    TResult? Function()? successRegister,
    TResult? Function(String errorMessage)? errorRegister,
  }) {
    return errorRegister?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingRegister,
    TResult Function()? successRegister,
    TResult Function(String errorMessage)? errorRegister,
    required TResult orElse(),
  }) {
    if (errorRegister != null) {
      return errorRegister(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingRegister value) loadingRegister,
    required TResult Function(SuccessRegister value) successRegister,
    required TResult Function(ErrorRegister value) errorRegister,
  }) {
    return errorRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingRegister value)? loadingRegister,
    TResult? Function(SuccessRegister value)? successRegister,
    TResult? Function(ErrorRegister value)? errorRegister,
  }) {
    return errorRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingRegister value)? loadingRegister,
    TResult Function(SuccessRegister value)? successRegister,
    TResult Function(ErrorRegister value)? errorRegister,
    required TResult orElse(),
  }) {
    if (errorRegister != null) {
      return errorRegister(this);
    }
    return orElse();
  }
}

abstract class ErrorRegister implements RegisterState {
  const factory ErrorRegister({required final String errorMessage}) =
      _$ErrorRegisterImpl;

  String get errorMessage;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorRegisterImplCopyWith<_$ErrorRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
