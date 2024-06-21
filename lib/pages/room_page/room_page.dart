import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mp_tic_tac_toe/components/primary_button.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/pages/lobby_page/lobby_page.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconsPath.backIcon),
                  const SizedBox(width: 15,),
                  Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Text(
                  "Enter the Code to Join with your Friends",
                   style: Theme.of(context)
                       .textTheme
                       .bodyMedium
                       ?.copyWith(
                     color: Theme.of(context).colorScheme.primary
                   )
              ),
              const SizedBox(height: 20,),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  filled: true,
                  hintText: "Enter Code...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 20,),
              PrimaryButton(
                  buttonText: "Join Now",
                  onTap: () {}
              ),
              const SizedBox(height: 80,),
              Text(
                  "Create private room",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                      color: Theme.of(context).colorScheme.primary
                  )
              ),
              const Spacer(),
              const SizedBox(height: 20,),
              PrimaryButton(
                  buttonText: "Create Room ",
                  onTap: () {
                    Get.to(LobbyPage());
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
