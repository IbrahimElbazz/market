import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:market/features/auth/login/logic/cubit/login_state.dart';
import 'package:market/features/auth/register/ui/register_screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          resetPasswordLoading: () {
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
          resetPasswordError: (errorMessage) {
            Navigator.pop(context);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(errorMessage)),
                backgroundColor: Colors.blue,
              ),
            );
          },
          resetPasswordSuccess: () {
            Navigator.pop(context);
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text('done')),
                backgroundColor: Colors.green,
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
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            )),
                        Text(
                          'Enter your email to reset password',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const GapH(height: 50),
                    Container(
                      width: 380.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            const GapH(height: 50),
                            CustomTextField(
                              hint: 'Email',
                              controller: context
                                  .read<LoginCubit>()
                                  .resendEmailController,
                            ),
                            const GapH(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                cub.forgetPassword();
                              },
                              child: Container(
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const GapH(height: 50),
                          ],
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
