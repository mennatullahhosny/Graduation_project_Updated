import 'package:flutter/material.dart';
import 'package:graduation_project/ui/Home_Screen/home_screen.dart';
import 'package:graduation_project/ui/Main_Screen/main_screen.dart';
import 'package:graduation_project/ui/Splash_Screen/splash_screen.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/sign_up_screen/sign_up_screen.dart';
import 'package:graduation_project/ui/sing_in_screen/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: SplashScreen.routName,
      routes: {
        SplashScreen.routName: (context) => const SplashScreen(),
        HomeScreen.routName: (context) => const HomeScreen(),
        MainScreen.routName: (context) => const MainScreen(),
        SignInScreen.routName: (context) => const SignInScreen(),
        SignUpScreen.routName: (context) => const SignUpScreen(),
        //CategoryDetails.routName: (context) => CategoryDetails(),
      },
    );
  }
}
