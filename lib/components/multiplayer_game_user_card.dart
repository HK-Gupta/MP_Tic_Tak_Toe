import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/assets_path.dart';

class MultiplayerGameUserCard extends StatelessWidget {
  final String icon;
  final String name;
  final String imageUrl;
  const MultiplayerGameUserCard({super.key, required this.icon, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            width: w/3,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60,),
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
                const SizedBox(height: 5,),
                Container(
                  height: 50,
                  width: w/4,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: SvgPicture.asset(icon),
                ),
                const SizedBox(height: 5,),
              ],
            ),
          ),
        ),
        Positioned(
          top: -40,
          left: w/3/2 - 50,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context)
                    .colorScheme
                    .secondary,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary,
                    width: 3
                )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: imageUrl==""
                  ? Image.asset(ImagePath.boyPath)
                  : Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
