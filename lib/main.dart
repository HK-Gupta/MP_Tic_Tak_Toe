import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/page_route.dart';
import 'package:mp_tic_tac_toe/configs/theme.dart';
import 'package:mp_tic_tac_toe/pages/splash/splash_screen.dart';
import 'package:mp_tic_tac_toe/pages/update_profile/update_profile.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}

//1.25 -- 20-06
//2.26 -- 21-06
//2.54 -- 22-06

