
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/circular_display_card.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class ProductCategoriesContainer extends StatelessWidget {
  const ProductCategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Categories-text
          Text(
            'Categories',
            style: AppFonts.poppins(fontSize: 14.sp, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),

          //Categories
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const CircularDisplayCard(
                  label: "All", image: Assets.trolleyImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(
                  label: "Fruits", image: Assets.fruitsImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(
                  label: "Grocery", image: Assets.groceryImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(
                  label: "Vegetables", image: Assets.vegetablesImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(label: "Meat", image: Assets.meatImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(
                  label: "Dairy", image: Assets.trolleyImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(
                  label: "Bakery", image: Assets.bakeyImage),
              SizedBox(
                width: 10.w,
              ),
              const CircularDisplayCard(
                  label: "Sweets", image: Assets.trolleyImage),
            ],
          ))
        ],
      ),
    );
  }
}
