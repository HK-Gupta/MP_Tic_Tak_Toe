import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../configs/assets_path.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String coins;
  final String status;
  const UserCard({super.key, required this.name, required this.imageUrl, required this.coins, this.status=""});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            width: w/2.6,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 60,),
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsPath.coinIcon, width: 20,),
                    const SizedBox(width: 10,),
                    Text(
                      "$coins COINS",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                status=="" ?
                    const SizedBox() :
                    status=="ready" ?
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.check, size: 20, color: Colors.green,),
                            const SizedBox(width: 4,),
                            Text(status.capitalizeFirst!, style: TextStyle(color: Colors.green[800]),),
                          ],
                        ),
                      ):
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.watch_later_outlined, size: 20, color: Colors.orange,),
                            const SizedBox(width: 4,),
                            Text(status.capitalizeFirst!, style: TextStyle(color: Colors.orange[800]),),
                          ],
                        ),
                      ),


                const SizedBox(height: 15,)
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
