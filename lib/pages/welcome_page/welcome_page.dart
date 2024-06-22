import 'package:concentric_transition/concentric_transition.dart';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final x = w<h ? w: h/1.3;
    var pages = [
      Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.splash1Path,
                width: x / 2,
                height: x / 2,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "Most fun Game Available on your device",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          )),
      Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagePath.splash2Path,
                width: x / 2,
                height: x / 2,
              ),
              const Text(
                "Compete",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "Play online with your friends and top the leaderboard!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          )),
      Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.splash3Path,
              width: x / 2,
              height: x / 2,
            ),
            const Text(
              "Scoreboard",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              "Earn points for each game and make your way to top the scoreboard!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            TextButton(
                onPressed: () {
                  Get.offAll(const RoomPage());
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.cyanAccent, fontSize: 18),
                )),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: ConcentricPageView(
        colors: const [Colors.red, Colors.green, Colors.blue],
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (index) {
          return pages[index];
        },
        // onFinish: ,
      ),
    );
  }
}
