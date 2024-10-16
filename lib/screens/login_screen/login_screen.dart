import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/models/user_model.dart';
import 'package:ideal_smart_app_demo/router/route_constants.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/home_screen.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/authentication_button.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/input_text_field.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/login_heading.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/widgets/secure_text_field.dart';
import 'package:ideal_smart_app_demo/screens/signup_screen/sign_up_screen.dart';
import 'package:ideal_smart_app_demo/services/shared_preferences/shared_prefs.dart';
import 'package:ideal_smart_app_demo/utils/app_fonts.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = RouteConstants.loginScreen;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backgroundImage), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            children: [
              //Top-heading
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: const Image(
                  image: AssetImage(Assets.appHeading),
                  alignment: Alignment.center,
                ),
              ),
              const Spacer(),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Shop Smart, Save\nBig on Groceries",
                    style: AppFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  //Sign-in-container
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
                          const DashedTitle(
                            title: "Login to your account",
                          ),

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
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              hintText: "Password"),

                          Column(
                            children: [
                              //Login-button
                              AuthenticationButton(
                                label: 'Login',
                                isLoading: _isLoading,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    //Login-user
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    final userModel = UserModel(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    SharedPrefs.instance
                                        .saveUser(userModel: userModel);
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      HomeScreen.routeName,
                                      (route) => false,
                                    );
                                  }
                                },
                              ),

                              //Forgot-password-button
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot Password?',
                                      style: AppFonts.poppins(
                                          color: Colors.black))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  //Register-text
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
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
