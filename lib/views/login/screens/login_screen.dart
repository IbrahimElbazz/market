import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/views/login/screens/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
