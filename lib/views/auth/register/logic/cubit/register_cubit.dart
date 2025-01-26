import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/views/auth/register/logic/cubit/register_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SupabaseClient client = Supabase.instance.client;

  Future<void> register() async {
    emit(const RegisterState.loadingRegister());
    try {
      await client.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(const RegisterState.successRegister());
    } on AuthApiException catch (e) {
      emit(RegisterState.errorRegister(errorMessage: e.toString()));
    } catch (e) {
      emit(RegisterState.errorRegister(errorMessage: e.toString()));
    }
  }
}
