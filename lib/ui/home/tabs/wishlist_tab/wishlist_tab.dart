import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_searchBar.dart';

class WishlistTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset("assets/route_leading_icon.svg")
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          children: [
            const SizedBox(width: 15),
            Expanded(flex: 8, child: CustomSearchBar()),
            Expanded(
                flex: 2,
                child: SvgPicture.asset("assets/shopping_cart_icon.svg"))
          ],
        ),
      ],
    );
  }
}
