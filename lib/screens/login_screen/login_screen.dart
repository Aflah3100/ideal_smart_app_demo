import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/router/route_constants.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/authentication_button.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/input_text_field.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/login_heading.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/secure_text_field.dart';
import 'package:ideal_smart_app_demo/screens/signup_screen/sign_up_screen.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = RouteConstants.loginScreen;
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Base-container
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backgroundImage), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Top-heading
              const Image(
                image: AssetImage(Assets.appHeading),
                alignment: Alignment.center,
              ),

              Text(
                "Shop Smart,Save\nBig on Groceries",
                style: AppFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),

              //Siign-in-container
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 290.h,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Login-heading
                      const LoginHeading(),

                      //Email-text-field
                      InputTextField(
                        validator: (email) {
                          return (email!.isEmpty)
                              ? "Please enter your email"
                              : null;
                        },
                        controller: emailController,
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                      ),

                      //Password-Text-field
                      SecureTextField(
                          validator: (password) {
                            return (password!.isEmpty)
                                ? "Password cannot be empty"
                                : null;
                          },
                          controller: passwordController,
                          icon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: "Password"),

                      Column(
                        children: [
                          //Login-button
                          AuthenticationButton(
                            label: 'Login',
                            onTap: () {
                              if (formKey.currentState!.validate()) {}
                            },
                          ),

                          //Forgot-password-button
                          TextButton(
                              onPressed: () {},
                              child: Text('Forgot Password?',
                                  style:
                                      AppFonts.poppins(color: Colors.black))),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?  ',
                    style: AppFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Text(
                      'Register',
                      style: AppFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
