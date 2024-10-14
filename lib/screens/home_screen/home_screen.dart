import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/main.dart';
import 'package:ideal_smart_app_demo/models/grocery_item_model.dart';
import 'package:ideal_smart_app_demo/models/user_model.dart';
import 'package:ideal_smart_app_demo/router/route_constants.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/circular_display_card.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/product_builder.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/product_categories_container.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/product_display_card.dart';
import 'package:ideal_smart_app_demo/services/api_services/grocery_api_services.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = RouteConstants.homeScreen;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello, User",
              style: AppFonts.poppins(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {
                  //Log-out-user
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: SafeArea(
          //Base-Container
          child: SizedBox(
        child: Column(
          children: [
            //Top-container
            const ProductCategoriesContainer(),

            //Products-container
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  //Special-Deal-Products
                  ProductBuilder(
                    title: "Special Deals",
                    future: GroceryApiServices.instance.fetchTopOfferItems(),
                  ),

                  //Latest-Products
                  ProductBuilder(
                    title: "Latest Products",
                    future: GroceryApiServices.instance.fetchGroceryItems(),
                  ),

                  //Top-Offers-Products
                  ProductBuilder(
                    title: "Special Deals",
                    future: GroceryApiServices.instance.fetchTopOfferItems(),
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
