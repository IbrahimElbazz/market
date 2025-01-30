import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/constant/table.dart';
import 'package:market/market.dart';
import 'package:market/views/auth/get_user_data/data/models/user_data_model.dart';
import 'package:market/views/auth/get_user_data/logic/cubit/get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(const GetUserDataState.initial());

  UserDataModel? userDataModel;
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
      log(data.toString());
      emit(const GetUserDataState.getUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(const GetUserDataState.getUserDataError());
    }
  }
}
