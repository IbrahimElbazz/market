import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
    );
  }
}

class GapH extends StatelessWidget {
  const GapH({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class GapW extends StatelessWidget {
  const GapW({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
