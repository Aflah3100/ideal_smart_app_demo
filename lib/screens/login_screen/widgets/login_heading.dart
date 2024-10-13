import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class LoginHeading extends StatelessWidget {
  const LoginHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 5.w,
                height: 10.h,
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
                child: Text(
                  "Login to your account",
                  style: AppFonts.poppins(fontSize: 11.sp),
                ),
              ),
              Container(
                width: 5.w,
                height: 10.h,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
