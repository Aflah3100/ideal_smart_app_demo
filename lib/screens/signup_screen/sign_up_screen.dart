import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/router/route_constants.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/login_screen.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/authentication_button.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/input_text_field.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/login_heading.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/secure_text_field.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = RouteConstants.signupScreen;
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //App-heading
              Column(
                children: [
                  //Image
                  const Image(
                    image: AssetImage(Assets.appHeading),
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  //Heading
                  Text(
                    "Welcome to !DealMart",
                    style: AppFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),

              //Signup-text-fields
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Sign-up-text
                    const DashedTitle(title: "Create an Account"),
                    SizedBox(
                      height: 15.h,
                    ),

                    //Email-text-field
                    InputTextField(
                      validator: (email) =>
                          email!.isEmpty ? "Please enter your email" : null,
                      controller: emailController,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      required: true,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //Name-text-field
                    InputTextField(
                      validator: (name) =>
                          name!.isEmpty ? "Please enter your Full Name" : null,
                      controller: nameController,
                      hintText: "Full Name",
                      keyboardType: TextInputType.name,
                      required: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //Phone-number-text-field
                    InputTextField(
                      validator: (phone) => phone!.isEmpty
                          ? "Please enter your phone number"
                          : null,
                      controller: phoneNumberController,
                      hintText: "123-456-789",
                      keyboardType: TextInputType.number,
                      required: true,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //Password-text-field
                    SecureTextField(
                      validator: (password) =>
                          password!.isEmpty ? "Password cannot be empty" : null,
                      controller: passwordController,
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      required: true,
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //Retype-password-text-field
                    SecureTextField(
                      validator: (confPassword) => confPassword!.isEmpty
                          ? "Retype Password cannot be empty"
                          : null,
                      controller: confirmPasswordController,
                      hintText: "Retype Password",
                      keyboardType: TextInputType.visiblePassword,
                      required: true,
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              //Signup-button
              AuthenticationButton(
                  label: "Signup",
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  }),
              SizedBox(
                height: 20.h,
              ),
              //Login-text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?  ',
                    style: AppFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      'Login',
                      style: AppFonts.poppins(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),

              //Privacy-policy-text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By continuing you agree to our ',
                    style: AppFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 8.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      'Terms of Service and Privacy Policy',
                      style: AppFonts.poppins(
                        color: AppColors.primaryColor,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
