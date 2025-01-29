import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/nav_bar/nav_bar.dart';
import 'package:market/views/auth/login/logic/cubit/login_cubit.dart';
import 'package:market/views/auth/login/presentation/screens/login_screen.dart';
import 'package:market/views/auth/register/logic/cubit/register_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class market extends StatelessWidget {
  const market({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;

    return ScreenUtilInit(
      designSize: const Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'market',
          home:
              client.auth.currentUser == null ? const LoginScreen() : NavBar(),
        ),
      ),
    );
  }
}
