import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategory extends StatelessWidget {
  String imagePath;
  String categoryName;

  CustomCategory({required this.imagePath, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // Border width
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(50), // Image radius
              child: CachedNetworkImage(
                imageUrl: imagePath,
                placeholder: (context, name) {
                  return SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: AppColors.primaryColor,
                      highlightColor: AppColors.accentColor,
                      child: Container(
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          categoryName,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.17,
              color: Color(0xff06004F)),
        )
      ],
    );
  }
}
