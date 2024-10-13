
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class SecureTextField extends StatefulWidget {
  const SecureTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? icon;
  final String? Function(String?)? validator;

  @override
  State<SecureTextField> createState() => _SecureTextFieldState();
}

class _SecureTextFieldState extends State<SecureTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greyColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          hintStyle:
              AppFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              (obscureText) ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          )),
    );
  }
}

