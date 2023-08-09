import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'what do you search for?',
        hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff06004f),
            letterSpacing: -0.17),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SvgPicture.asset(
            "assets/search_icon.svg",
            colorFilter:
                ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
