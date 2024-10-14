import 'package:flutter/material.dart';
import 'package:ideal_smart_app_demo/models/grocery_item_model.dart';
import 'package:ideal_smart_app_demo/screens/product_detail_screen/product_detail_screen.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class ProductDisplayCard extends StatelessWidget {
  const ProductDisplayCard({
    super.key,
    required this.product,
  });

  final GroceryItemModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeName,
            arguments: product);
      },
      child: SizedBox(
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image-Container
            Stack(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Image(
                      image: NetworkImage(
                        product.imageURL ?? "",
                      ),
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                        );
                      },
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                //Product-Discount
                Positioned(
                  left: 5,
                  child: Container(
                    width: 22,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Center(
                      child: Text(
                        "${product.discountPercentage ?? ""}%\nOFF",
                        style: AppFonts.poppins(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),

            //Product-Details
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Product-name
                Text(
                  product.itemName ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.start,
                  style: AppFonts.poppins(fontWeight: FontWeight.w500),
                ),
                //Product-company
                Text(
                  product.companyProduced ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.start,
                  style: AppFonts.poppins(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                ),
                //Product-price
                Text(
                  "\$ ${product.newPrice}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //Old-price
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "\$ ${product.oldPrice}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                    //Add-button
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "ADD",
                        style: AppFonts.poppins(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400),
                      )),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
