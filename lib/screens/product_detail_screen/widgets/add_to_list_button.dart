import 'package:flutter/material.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class AddToListButton extends StatelessWidget {
  const AddToListButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Add to List",
                style: AppFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
