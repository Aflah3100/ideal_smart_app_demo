// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/router/route_constants.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/product_builder.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/widgets/product_categories_container.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/login_screen.dart';
import 'package:ideal_smart_app_demo/services/api_services/grocery_api_services.dart';
import 'package:ideal_smart_app_demo/services/shared_preferences/shared_prefs.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';

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
                  _showLogoutDialog(context);
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
                    title: "Top Offers",
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Log Out',
            style: AppFonts.poppins(),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: AppFonts.poppins(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppFonts.poppins(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final result = await SharedPrefs.instance.deleteUser();

                if (result) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.routeName,
                    (route) => false,
                  );
                }
              },
              child: Text(
                'Logout',
                style: AppFonts.poppins(),
              ),
            ),
          ],
        );
      },
    );
  }
}
