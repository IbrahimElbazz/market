import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.iconButton,
    this.enable,
    this.isPassword,
  });
  final String? hint;
  final TextEditingController? controller;
  final Widget? iconButton;
  final bool? enable;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'enter value ';
        }
        return null;
      },
      enabled: enable,
      controller: controller,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
          hintText: hint ?? "",
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: iconButton ?? const SizedBox.shrink(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          )),
    );
  }
}
