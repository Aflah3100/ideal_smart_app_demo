
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/models/grocery_item_model.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/product_display_card.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
    required this.title,
    this.future,
  });
  final String title;
  final Future<List<GroceryItemModel>>? future;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 250,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          Text(
            title,
            style: AppFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            height: 10.w,
          ),
          //Future-builder
          Expanded(
              child: FutureBuilder<List<GroceryItemModel>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductDisplayCard(product: snapshot.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 15.w,
                      );
                    },
                    itemCount: snapshot.data!.length);
              }

              return const SizedBox();
            },
          ))
        ],
      ),
    );
  }
}
