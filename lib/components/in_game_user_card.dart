import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/assets_path.dart';

class InGameUserCard extends StatelessWidget {
  final String icon;
  const InGameUserCard({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            height: 110,
            width: w/2.9,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                // Text(
                //   "Harsh Kumar",
                //   style: Theme.of(context)
                //       .textTheme
                //       .bodyMedium,
                // ),
                const SizedBox(height: 5,),
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: SvgPicture.asset(icon),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: w/2.9/2 - 50,
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
            child: Image.asset(ImagePath.boyPath),
          ),
        ),
      ],
    );
  }
}
