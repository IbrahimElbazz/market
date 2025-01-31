import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/constant/table.dart';
import 'package:market/market.dart';
import 'package:market/features/auth/register/logic/cubit/register_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(const RegisterState.loadingRegister());
    try {
      await client.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      saveUserData();
      emit(const RegisterState.successRegister());
    } on AuthApiException catch (e) {
      emit(RegisterState.errorRegister(errorMessage: e.message));
    } catch (e) {
      emit(RegisterState.errorRegister(errorMessage: e.toString()));
    }
  }

  Future<void> saveUserData() async {
    emit(const RegisterState.saveUserDataLoading());
    try {
      await client.from(TableHelper.userDataTable).insert({
        'name': nameController.text,
        'email': emailController.text,
        'id': client.auth.currentUser!.id
      });

      emit(const RegisterState.saveUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(const RegisterState.saveUserDataError());
    }
  }
}
