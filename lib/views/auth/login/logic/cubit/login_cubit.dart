import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/views/auth/login/logic/cubit/login_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());
    try {
      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      emit(const LoginState.success());
    } on AuthApiException catch (e) {
      emit(LoginState.error(errorMessage: e.toString()));
    } catch (e) {
      emit(LoginState.error(errorMessage: e.toString()));
    }
  }
}
