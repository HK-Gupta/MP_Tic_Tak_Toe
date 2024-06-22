import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/assets_path.dart';

class PricingArea extends StatelessWidget {
  const PricingArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Row(
                children: [
                  Text("Entry Price"),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                  ),
                )
              ],
            ),
            Container(
              width: 150,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox( width: 10,),
                  Text("15 COINS"),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Row(
                children: [
                  Text("Winning Price"),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                  ),
                )
              ],
            ),

            Container(
              width: 150,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox( width: 10,),
                  Text("30 COINS"),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
