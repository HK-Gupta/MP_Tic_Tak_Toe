import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mp_tic_tac_toe/components/primary_button.dart';
import 'package:mp_tic_tac_toe/configs/assets_path.dart';
import 'package:mp_tic_tac_toe/configs/colors.dart';
import 'package:mp_tic_tac_toe/controller/room_controller.dart';
import 'package:mp_tic_tac_toe/pages/lobby_page.dart';

import '../configs/messages.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    RoomController roomController = Get.put(RoomController());
    TextEditingController roomIdController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                      child: SvgPicture.asset(IconsPath.backIcon, color: Colors.white,)
                  ),
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

              ),
              const SizedBox(height: 20,),
              TextField(
                controller: roomIdController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Theme.of(context)
                      .colorScheme
                      .secondary,
                  filled: true,
                  hintText: "Enter Code...",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )
                ),
                  style: TextStyle(color: Colors.black)
              ),
              const SizedBox(height: 20,),
              Obx(() =>
                roomController.isLoading.value?
                    const CircularProgressIndicator(color: primaryColor,):
                    PrimaryButton(
                        buttonText: "Join Now",
                        onTap: () {
                          roomIdController.text==""?
                          errorToastMessage("Please Fill all the Fields"):
                          roomController.joinRoom(roomIdController.text);
                        }
                    ),
              ),
              const SizedBox(height: 40,),
              Text(
                  "Create private room",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer
                  )
              ),
              const Spacer(),
              const SizedBox(height: 20,),
              Obx(() => roomController.isLoading.value
                  ? const CircularProgressIndicator(color: primaryColor,)
                  : PrimaryButton(
                  buttonText: "Create Room ",
                  onTap: () {
                    roomController.createRoom();
                  }
              ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
