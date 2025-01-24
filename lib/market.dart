import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/views/auth/login/ui/login_screen.dart';

class market extends StatelessWidget {
  const market({super.key});
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'market',
        home: LoginScreen(),
      ),
    );
  }
}
