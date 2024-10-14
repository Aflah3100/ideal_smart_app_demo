import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/models/grocery_item_model.dart';
import 'package:ideal_smart_app_demo/router/route_constants.dart';
import 'package:ideal_smart_app_demo/screens/product_detail_screen/widgets/add_to_favorite_button.dart';
import 'package:ideal_smart_app_demo/screens/product_detail_screen/widgets/add_to_list_button.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = RouteConstants.productDetailScreen;
  const ProductDetailScreen({super.key, required this.product});
  final GroceryItemModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Product Details",
          style: AppFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Product-image-container
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.3,
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

              //Product-details
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Product-title
                    Text(
                      product.itemName ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: AppFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //Product-price
                            Text(
                              "\$ ${product.newPrice ?? ""}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 19),
                            ),

                            SizedBox(
                              width: 8.w,
                            ),

                            //Discount
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(183, 116, 234, 120),
                                  borderRadius: BorderRadius.circular(15)),
                              width: 60,
                              height: 30,
                              child: Center(
                                  child: Text(
                                "${product.discountPercentage ?? ""}% off",
                                style: AppFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromARGB(255, 11, 124, 14)),
                              )),
                            ),
                          ],
                        ),
                        //Discount-time-period
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 216, 216),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.alarm_outlined,
                                size: 15,
                                weight: 100,
                              ),
                              Text(
                                "5 days left",
                                style: AppFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    //Product-Old-price
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "\$ ${product.oldPrice}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //Produt-details-row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Details",
                                style: AppFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              //Product-brand
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Brand: ",
                                    style: AppFonts.poppins(
                                        color: Colors.grey.shade600),
                                  ),
                                  Flexible(
                                    child: Text(
                                      product.companyProduced ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: AppFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),

                              //Product-quantity
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Qnt: ",
                                    style: AppFonts.poppins(
                                        color: Colors.grey.shade600),
                                  ),
                                  Text(
                                    "2 (lb)",
                                    style: AppFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seller",
                                  style: AppFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                //Product-company
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.storefront_outlined),
                                    Flexible(
                                      child: Text(
                                        " ${product.store ?? ""}",
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.poppins(
                                            color: Colors.pink,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),

                                //Product-location
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.pin_drop_outlined),
                                    Flexible(
                                      child: Text(
                                        " ${product.location ?? ""}",
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: AppFonts.poppins(
                                            color: Colors.pink,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    Text(
                      "Product Description",
                      style: AppFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 19),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    //Product-description
                    Text(
                      product.productDescription ?? "",
                      style: AppFonts.poppins(color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 80,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Favorite-button
              AddToFavoriteButton(),

              //Add-to-List-button
              AddToListButton()
            ],
          ),
        ),
      ),
    );
  }
}
