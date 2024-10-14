import 'package:flutter/material.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
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
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_outline),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Favorite",
                style:
                    AppFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
