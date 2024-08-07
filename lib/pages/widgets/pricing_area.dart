import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mp_tic_tac_toe/configs/colors.dart';

import '../../configs/assets_path.dart';

class PricingArea extends StatelessWidget {
  final String entryFee;
  final String winningPrice;
  const PricingArea({super.key, required this.entryFee, required this.winningPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 140,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Row(
                children: [
                  Text("Entry Price", style: TextStyle(color: Colors.black),),
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
              width: 140,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: blueCross,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox( width: 5,),
                  Text("$entryFee COINS"),
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
              width: 140,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Text("$winningPrice Price",  style: TextStyle(color: Colors.black),),
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
              width: 140,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: blueCross,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox( width: 5,),
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
