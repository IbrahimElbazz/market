import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/market.dart';
import 'package:market/views/auth/logout/logic/cubit/logout_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(const LogoutState.initial());

  Future<void> logout() async {
    emit(const LogoutState.loadingLogout());

    try {
      await client.auth.signOut();
      emit(const LogoutState.successLogout());
    } catch (e) {
      emit(const LogoutState.errorLogout());
    }
  }
}
