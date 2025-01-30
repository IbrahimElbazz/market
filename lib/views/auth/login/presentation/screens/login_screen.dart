import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/nav_bar/nav_bar.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/views/auth/login/logic/cubit/login_cubit.dart';
import 'package:market/views/auth/login/logic/cubit/login_state.dart';
import 'package:market/views/auth/login/presentation/screens/forget_pass_screen.dart';
import 'package:market/views/auth/register/ui/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          successGoogle: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBar(),
                ));
          },
          success: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBar(),
                ));
          },
          loading: () {
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
          loadingGoogle: () {
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
          error: (errorMessage) {
            Navigator.pop(context);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(errorMessage)),
                backgroundColor: Colors.blue,
              ),
            );
          },
        );
      },
      buildWhen: (previous, current) {
        return current is Success || current is Error || current is Loading;
      },
      builder: (context, state) {
        final cub = context.read<LoginCubit>();
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: 430.w,
                child: Column(
                  children: [
                    const GapH(height: 50),
                    Text(
                      'Welcome to our market',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const GapH(height: 50),
                    Container(
                      width: 380.w,
                      height: 500.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Form(
                          key: context.read<LoginCubit>().formKeyLogin,
                          child: Column(
                            children: [
                              const GapH(height: 50),
                              CustomTextField(
                                hint: 'Email',
                                controller:
                                    context.read<LoginCubit>().emailController,
                              ),
                              const GapH(height: 20),
                              CustomTextField(
                                hint: 'Password',
                                isPassword: isPasswordHidden,
                                controller: context
                                    .read<LoginCubit>()
                                    .passwordController,
                                iconButton: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden = !isPasswordHidden;
                                    });
                                  },
                                  icon: Icon(
                                    isPasswordHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: isPasswordHidden
                                        ? Colors.grey
                                        : Colors.blue,
                                  ),
                                ),
                              ),
                              const GapH(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return const ForgetPassScreen();
                                        },
                                      ));
                                    },
                                    child: Text(
                                      'Forget password ?',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const GapH(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (context
                                      .read<LoginCubit>()
                                      .formKeyLogin
                                      .currentState!
                                      .validate()) {
                                    context.read<LoginCubit>().login();
                                  }
                                },
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const GapH(height: 20),
                              GestureDetector(
                                onTap: () {
                                  context.read<LoginCubit>().loginWithGoogle();
                                },
                                child: Container(
                                  height: 55.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red.withOpacity(0.2),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const GapH(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Do not have acc ?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  const GapW(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return const Register();
                                        },
                                      ));
                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
