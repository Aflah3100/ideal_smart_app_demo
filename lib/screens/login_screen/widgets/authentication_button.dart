// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class AuthenticationButton extends StatelessWidget {
  AuthenticationButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.isLoading = false});
  final String label;
  final void Function() onTap;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 55,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: (!isLoading)
              ? Text(
                  label,
                  style: AppFonts.poppins(color: Colors.white, fontSize: 11.sp),
                )
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
