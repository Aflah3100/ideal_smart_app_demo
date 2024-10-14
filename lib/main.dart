import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/router/generate_route.dart';
import 'package:ideal_smart_app_demo/screens/home_screen/home_screen.dart';
import 'package:ideal_smart_app_demo/screens/login_screen/login_screen.dart';
import 'package:ideal_smart_app_demo/services/shared_preferences/shared_prefs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Ideal Smart Demo App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: generateRoute,
            home: FutureBuilder(
              future: SharedPrefs.instance.getUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  //Logged-in
                  return const HomeScreen();
                }
                //Not-logged-in
                return const LoginScreen();
              },
            ),
          );
        });
  }
}
