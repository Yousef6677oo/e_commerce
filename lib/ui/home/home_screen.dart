import 'package:e_commerce/ui/categories/categories_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:e_commerce/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custom_icon_navigation_bar.dart';
import '../../components/custom_search_bar.dart';
import '../account/account_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      body: returnSelectedTab(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
                label: "HOME",
                icon: currentIndex == 0
                    ? CircularBottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/home_select_icon.svg"))
                    : SvgPicture.asset("assets/home_unselect_icon.svg")),
            BottomNavigationBarItem(
                label: "Categories",
                icon: currentIndex == 1
                    ? CircularBottomNavigationBarItem(
                        icon: SvgPicture.asset(
                            "assets/categories_select_icon.svg"))
                    : SvgPicture.asset("assets/categories_unselect_icon.svg")),
            BottomNavigationBarItem(
                label: "Wishlist",
                icon: currentIndex == 2
                    ? CircularBottomNavigationBarItem(
                        icon:
                            SvgPicture.asset("assets/wishlist_select_icon.svg"))
                    : SvgPicture.asset("assets/wishlist_unselect_icon.svg")),
            BottomNavigationBarItem(
                label: "Account",
                icon: currentIndex == 3
                    ? CircularBottomNavigationBarItem(
                        icon:
                            SvgPicture.asset("assets/account_select_icon.svg"))
                    : SvgPicture.asset("assets/account_unselect_icon.svg")),
          ],
        ),
      ),
    );
  }

  Widget homeScreen(){
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
        Center(
          child: ImageSlideshow(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.25,
            initialPage: 0,
            indicatorColor: Colors.transparent,
            indicatorBackgroundColor: Colors.transparent,
            autoPlayInterval: 5000,
            isLoop: true,
            children: [
              Image.asset("assets/image_slide_show_1.png"),
              Image.asset("assets/image_slide_show_2.png"),
              Image.asset("assets/image_slide_show_3.png"),
            ],
          ),
        ),
      ],
    );
  }

  Widget returnSelectedTab(){
    if(currentIndex==0){
      return homeScreen();
    }else if(currentIndex == 1){
      return CategoriesScreen();
    }else if(currentIndex == 2){
      return WishlistScreen();
    }else{
      return AccountScreen();
    }
  }
}
