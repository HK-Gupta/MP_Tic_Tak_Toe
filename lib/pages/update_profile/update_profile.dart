import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mp_tic_tac_toe/components/primary_icon_button.dart';
import 'package:mp_tic_tac_toe/controller/auth_controller.dart';
import 'package:mp_tic_tac_toe/controller/profile_controller.dart';

import '../../configs/assets_path.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ProfileController profileController = Get.put(ProfileController());
  RxString imagePath = "".obs;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final x = w<h ? w: h/1.3;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Profile Image
                Obx(() => imagePath.value==""?
                  Container(
                    width: x/2,
                    height: x/2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Icon(Icons.add_a_photo_outlined, size: x/4, color: Colors.grey,),
                  ): Container(
                    width: x/2,
                    height: x/2,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40),
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                      child: Image.file(File(imagePath.value), fit: BoxFit.cover,)
                  ),
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async{
                        imagePath.value = await profileController.pickImage(ImageSource.gallery);
                      } ,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.insert_photo, color: Colors.white, size: 40,),
                      ),
                    ),
                    SizedBox(height: x/(2*6)),
                    InkWell(
                    onTap: () async{
                      imagePath.value = await profileController.pickImage(ImageSource.camera);
                    },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.camera_enhance_rounded, color: Colors.white, size: 40,),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter your Name"
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              textAlign: TextAlign.center,
              "You can change these details later from Profile page.",
              style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const Spacer(),
            Obx(() => profileController.isLoading.value
                ? const CircularProgressIndicator()
                : PrimaryIconButton(
                    buttonText: "Save",
                    onTap: () {
                      profileController.updateProfile(nameController.text, imagePath.value);
                    },
                    iconPath: IconsPath.saveIcon),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
