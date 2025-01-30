import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market/core/constant/table.dart';
import 'package:market/market.dart';
import 'package:market/views/auth/login/logic/cubit/login_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController resendEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKeyLogin = GlobalKey<FormState>();

  // login
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

  // login with google
  GoogleSignInAccount? googleUser;
  Future<AuthResponse> loginWithGoogle() async {
    emit(const LoginState.loadingGoogle());
    const webClientId =
        '319207036848-ufnfisd78cj98776tclu54vr69b58p2g.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }

    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(const LoginState.errorGoogle());
      return AuthResponse();
    }

    AuthResponse response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    saveUserData(email: googleUser!.email, name: googleUser!.displayName!);
    emit(const LoginState.successGoogle());
    return response;
  }

  Future<void> saveUserData(
      {required String name, required String email}) async {
    emit(const LoginState.saveUserDataLoading());
    try {
      await client.from(TableHelper.userDataTable).upsert(
          {'name': name, 'email': email, 'id': client.auth.currentUser!.id});

      emit(const LoginState.saveUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(const LoginState.saveUserDataError());
    }
  }

  // reset password

  Future<void> forgetPassword() async {
    emit(const LoginState.resetPasswordLoading());

    try {
      await client.auth.resetPasswordForEmail(
        resendEmailController.text,
      );
    } on AuthApiException catch (e) {
      emit(LoginState.resetPasswordError(errorMessage: e.message.toString()));
    }
  }
}
