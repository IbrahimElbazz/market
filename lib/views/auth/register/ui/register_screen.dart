import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/nav_bar/nav_bar.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/views/auth/register/logic/cubit/register_cubit.dart';
import 'package:market/views/auth/register/logic/cubit/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          successRegister: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBar(),
                ));
          },
          loadingRegister: () {
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
          errorRegister: (errorMessage) {
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
      listenWhen: (previous, current) {
        return current is SuccessRegister ||
            current is ErrorRegister ||
            current is LoadingRegister;
      },
      builder: (context, state) {
        final cub = context.read<RegisterCubit>();
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
                      'Create new account',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
                        child: Form(
                          key: cub.formKey,
                          child: Column(
                            children: [
                              const GapH(height: 50),
                              CustomTextField(
                                hint: 'name',
                                controller: cub.nameController,
                              ),
                              const GapH(height: 20),
                              CustomTextField(
                                hint: 'Email',
                                controller: cub.emailController,
                              ),
                              const GapH(height: 20),
                              CustomTextField(
                                hint: 'Password',
                                isPassword: isPasswordHidden,
                                controller: cub.passwordController,
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
                              const GapH(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (cub.formKey.currentState!.validate()) {
                                    cub.register();
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
                                      'Register',
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       return NavBar();
                                  //     },
                                  //   ),
                                  // );
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
                                    'I already have acc : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  const GapW(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'login',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const GapH(height: 15),
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
