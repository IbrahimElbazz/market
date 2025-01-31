import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/features/auth/login/presentation/screens/login_screen.dart';
import 'package:market/features/auth/logout/logic/cubit/logout_cubit.dart';
import 'package:market/features/auth/logout/logic/cubit/logout_state.dart';

class logout extends StatelessWidget {
  const logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listenWhen: (previous, current) {
        return current is ErrorLogout ||
            current is LoadingLogout ||
            current is SuccessLogout;
      },
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loadingLogout: () {
            return showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              },
            );
          },
          successLogout: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
        );
      },
      child: GestureDetector(
        onTap: () async {
          context.read<LogoutCubit>().logout();
        },
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
