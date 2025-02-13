import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/di/dependency_injection.dart';
import 'package:market/core/nav_bar/nav_bar.dart';
import 'package:market/features/auth/get_user_data/logic/cubit/get_user_data_cubit.dart';
import 'package:market/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:market/features/auth/login/presentation/screens/login_screen.dart';
import 'package:market/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

SupabaseClient client = Supabase.instance.client;

class market extends StatelessWidget {
  const market({super.key});

  @override
  Widget build(BuildContext context) {
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
          BlocProvider(
            create: (context) => GetUserDataCubit(),
          ),
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ProductDetailsCubit>(),
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
