import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/views/auth/get_user_data/data/models/user_data_model.dart';

part 'get_user_data_state.freezed.dart';

@freezed
class GetUserDataState<T> with _$GetUserDataState<T> {
  const factory GetUserDataState.initial() = _Initial;

  const factory GetUserDataState.getUserDataLoading() = getUserDataLoading;
  const factory GetUserDataState.getUserDataSuccess() = GetUserDataSuccess<T>;
  const factory GetUserDataState.getUserDataError() = GetUserDataError;
}
