import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/app_colors.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryColor, size: 35),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Cart",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.17,
                color: AppColors.primaryColor),
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                SvgPicture.asset('assets/search_icon.svg'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                SvgPicture.asset('assets/shopping_cart_icon.svg'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              ],
            )
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.06),
              Column(
                children: [
                  Text(
                    'Total price',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: const Color(0x9d06004f)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    "EGP 3,500",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.primaryColor),
                  )
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                        )
                    )
                ),
                  onPressed: null,
                  child: Row(
                    children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 15.0),
                         child: Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.17,
                            color: AppColors.accentColor
                          ),
                      ),
                       ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2),
                      SvgPicture.asset('assets/check_out_icon.svg',width: 35,)
                    ],
                  ))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07)
        ],
      ),
    );
  }
}
