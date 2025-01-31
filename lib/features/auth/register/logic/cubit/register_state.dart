import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loadingRegister() = LoadingRegister;
  const factory RegisterState.successRegister() = SuccessRegister;
  const factory RegisterState.errorRegister({required String errorMessage}) =
      ErrorRegister;

  // save user data when register
  const factory RegisterState.saveUserDataLoading() = SaveUserDataLoading;
  const factory RegisterState.saveUserDataSuccess() = saveUserDataSuccess;
  const factory RegisterState.saveUserDataError() = saveUserDataError;
}
