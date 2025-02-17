import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/constant/table.dart';
import 'package:market/market.dart';
import 'package:market/features/auth/get_user_data/data/models/user_data_model.dart';
import 'package:market/features/auth/get_user_data/logic/cubit/get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(const GetUserDataState.initial());

  UserDataModel? userDataModel;
  UserDataModel? userData;
  Future<void> getUserData() async {
    emit(const GetUserDataState.getUserDataLoading());
    try {
      final data = await client
          .from(TableHelper.userDataTable)
          .select()
          .eq('id', client.auth.currentUser!.id);
      userDataModel = UserDataModel(
        id: data[0]['id'],
        name: data[0]['name'],
        email: data[0]['email'],
      );

      emit(const GetUserDataState.getUserDataSuccess());
    } catch (e) {
      emit(const GetUserDataState.getUserDataError());
    }
  }
}
