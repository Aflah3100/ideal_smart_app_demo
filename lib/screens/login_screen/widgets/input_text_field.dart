// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class InputTextField extends StatelessWidget {
  InputTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.required = false, this.keyboardType});

  final String hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Required-text
        if (required) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Required",
                style: AppFonts.poppins(fontSize: 11.sp, color: Colors.black),
              ),
              Text(
                "*",
                style: AppFonts.poppins(fontSize: 12.sp, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
        ],
        TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
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
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: AppFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 12.sp)),
        ),
      ],
    );
  }
}
