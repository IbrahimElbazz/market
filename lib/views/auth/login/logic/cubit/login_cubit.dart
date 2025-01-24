import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/views/auth/login/logic/cubit/login_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  SupabaseClient client = Supabase.instance.client;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(const LoginState.loading());
    try {
      await client.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(const LoginState.success());
    } on AuthApiException catch (e) {
      emit(
        LoginState.error(
          errorMessage: e.message.toString(),
        ),
      );
    }
  }
}
