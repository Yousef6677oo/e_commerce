import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  String elevatedButtonText;
  Function elevatedButtonFunction;

  CustomElevatedButton(
      {required this.elevatedButtonText, required this.elevatedButtonFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
        onPressed: () {
          elevatedButtonFunction();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17.0),
          child: Text(elevatedButtonText,
              style: Theme.of(context).textTheme.displayLarge),
        ));
  }
}
