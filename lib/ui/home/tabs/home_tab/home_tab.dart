import 'package:e_commerce/domain/model/DataDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_category.dart';
import '../../../../components/custom_searchBar.dart';
import 'home_view_model.dart';

class HomeTab extends StatelessWidget {
  List<CategoriesDataDto>? listCat;
  var viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    buildCategories();
    return BlocConsumer<HomeViewModel, HomeViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          //DialogUtils.hideDialog(context);
        }
        if (current is SuccessState ||
            current is FailState ||
            current is LoadingState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is FailState) {
          // DialogUtils.showMessageDialog(
          //     context, state.failMessage ?? 'something went wrong');
        } else if (state is LoadingState) {
          //DialogUtils.loadingDialog(context);
        } else if (state is SuccessState) {
          // AuthenticationProvider provider = BlocProvider.of(context);
          // provider.login(LoggedInState(
          //     user: state.response.user!, token: state.response.token!));
          // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      buildWhen: (previous, current) {
        if (current is InitialState || current is SuccessState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                "Categories",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Color(0xff06004F)),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
                itemBuilder: (context, index) {
                  return CustomCategory(
                    imagePath: listCat?[index].image ?? '',
                    categoryName: listCat?[index].name ?? '',
                  );
                },
                itemCount: listCat?.length ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }

  void buildCategories() async {
    listCat = await viewModel.getAllCategories();
  }
}
