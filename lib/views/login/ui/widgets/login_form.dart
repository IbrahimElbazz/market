import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/nav_bar/nav_bar.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 450.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const GapH(height: 50),
            const CustomTextField(
              hint: 'Email',
            ),
            const GapH(height: 20),
            CustomTextField(
              hint: 'password',
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ),
            const GapH(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget password ?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            const GapH(
              height: 30,
            ),
            Container(
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
            const GapH(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return NavBar();
                  },
                ));
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
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
