import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/page_route.dart';
import 'package:mp_tic_tac_toe/configs/theme.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';

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
      home: const RoomPage(),
    );
  }
}

//1.25 -- 20-06
//1.55 -- 21-06

