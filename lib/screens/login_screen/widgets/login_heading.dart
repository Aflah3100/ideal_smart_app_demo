import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class DashedTitle extends StatelessWidget {
  const DashedTitle({
    super.key,
    required this.title,
  });
  final String title;

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
                  title,
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
