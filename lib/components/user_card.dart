import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/assets_path.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            height: 125,
            width: w/2.6,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 60,),
                Text(
                  "Harsh Kumar",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsPath.coinIcon, width: 20,),
                    SizedBox(width: 10,),
                    Text(
                      "15 COINS",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: w/2.6/2 - 50,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                    width: 3
                )
            ),
          ),
        ),
      ],
    );
  }
}
