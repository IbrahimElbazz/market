import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.freezed.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _Initial;
  const factory LogoutState.loadingLogout() = LoadingLogout;
  const factory LogoutState.successLogout() = SuccessLogout;
  const factory LogoutState.errorLogout() = ErrorLogout;
}
