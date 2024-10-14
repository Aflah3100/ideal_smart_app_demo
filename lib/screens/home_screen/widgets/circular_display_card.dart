
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class CircularDisplayCard extends StatelessWidget {
  const CircularDisplayCard({
    super.key,
    required this.label,
    required this.image,
  });
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          label,
          style: AppFonts.poppins(
              fontSize: 10.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
