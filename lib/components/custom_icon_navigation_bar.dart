import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularBottomNavigationBarItem extends StatelessWidget {
  final SvgPicture icon;

  const CircularBottomNavigationBarItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Change the color as needed
                ),
                child: icon),
          ],
        ),
      ),
    );
  }
}
