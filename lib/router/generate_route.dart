import 'package:flutter/material.dart';
import 'package:ideal_smart_app_demo/models/user_model.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/home_screen.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/login_screen.dart';
import 'package:ideal_smart_app_demo/screens/product_detail_screen/product_detail_screen.dart';
import 'package:ideal_smart_app_demo/screens/signup_screen/sign_up_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => SignUpScreen());

    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case ProductDetailScreen.routeName:
      return MaterialPageRoute(builder: (_) => ProductDetailScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text(
                    "Screen does not Exist",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ));
  }
}
