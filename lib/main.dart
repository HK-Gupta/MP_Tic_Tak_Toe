import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/page_route.dart';
import 'package:mp_tic_tac_toe/configs/theme.dart';
import 'package:mp_tic_tac_toe/pages/auth/auth_page.dart';
import 'package:mp_tic_tac_toe/pages/home_page/home_page.dart';
import 'package:mp_tic_tac_toe/pages/splash/splash_screen.dart';
import 'package:mp_tic_tac_toe/pages/update_profile/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      // home: const SplashScreen(),
      home: const UpdateProfile(),
    );
  }
}

//1.25 -- 20-06
//2.26 -- 21-06
//2.45 -- 22-06

