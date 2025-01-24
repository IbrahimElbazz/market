import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.iconButton,
    this.enable,
  });
  final String? hint;
  final TextEditingController? controller;
  final Widget? iconButton;
  final bool? enable;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint ?? "",
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: iconButton ?? const SizedBox.shrink(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
