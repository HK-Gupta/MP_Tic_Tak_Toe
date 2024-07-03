import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryIconButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final String iconPath;
  const PrimaryIconButton({super.key, required this.buttonText, required this.onTap, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath,),
            const SizedBox(width: 15,),
            Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                    color: Colors.white
                ),
            ),
          ],
        ),
      ),
    );
  }
}
