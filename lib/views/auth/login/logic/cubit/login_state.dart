import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.success() = Success;
  const factory LoginState.error({required String errorMessage}) = Error;
  const factory LoginState.loading() = Loading;
}
