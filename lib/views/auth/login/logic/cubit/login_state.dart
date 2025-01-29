import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.success() = Success;
  const factory LoginState.error({required String errorMessage}) = Error;
  const factory LoginState.loading() = Loading;

  // login with Google

  const factory LoginState.successGoogle() = SuccessGoogle;
  const factory LoginState.errorGoogle() = ErrorGoogle;
  const factory LoginState.loadingGoogle() = LoadingGoogle;

  // reset password
  const factory LoginState.resetPasswordLoading() = ResetPasswordLoading;
  const factory LoginState.resetPasswordSuccess() = ResetPasswordSuccess;
  const factory LoginState.resetPasswordError({required String errorMessage}) =
      ResetPasswordError;
}
