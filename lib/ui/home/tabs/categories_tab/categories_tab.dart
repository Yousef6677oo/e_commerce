import 'package:e_commerce/domain/model/SubCategoriesDataDto.dart';
import 'package:e_commerce/ui/home/tabs/categories_tab/categories_view_model.dart';
import 'package:e_commerce/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_searchBar.dart';

class CategoriesTab extends StatefulWidget {
  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  List<SubCategoriesDataDto>? listCat;
  List<SubCategoriesDataDto>? listCatOnCat;

  int currentIndex = -1;

  var viewModel = CategoriesViewModel();

  @override
  Widget build(BuildContext context) {
    buildCategories();
    return BlocConsumer<CategoriesViewModel, CategoriesViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          //DialogUtils.hideDialog(context);
        }
        if (current is SuccessGetAllSubCategoriesState ||
            current is SuccessGetAllSubCategoriesOnCategoryState ||
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
        } else if (state is SuccessGetAllSubCategoriesState) {
          // AuthenticationProvider provider = BlocProvider.of(context);
          // provider.login(LoggedInState(
          //     user: state.response.user!, token: state.response.token!));
          // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      buildWhen: (previous, current) {
        if (current is InitialState ||
            current is SuccessGetAllSubCategoriesState ||
            current is SuccessGetAllSubCategoriesOnCategoryState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Column(
              children: [
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
                        child:
                            SvgPicture.asset("assets/shopping_cart_icon.svg"))
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            border: Border.all(
                                width: 1, color: const Color(0xffB3C6DA))),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                currentIndex = index;
                                setState(() {
                                  buildCategoriesOnCategory(listCat?[index].category??'');
                                });
                              },
                              child: Container(
                                height: isSelectedCategory(index)
                                    ? MediaQuery.of(context).size.height * 0.11
                                    : MediaQuery.of(context).size.height * 0.1,
                                color: isSelectedCategory(index)
                                    ? const Color(0xffffffff)
                                    : const Color(0xffDBE4ED),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: isSelectedCategory(index)
                                          ? const EdgeInsets.only(
                                              left: 5.0, right: 5)
                                          : const EdgeInsets.only(
                                              left: 0.0, right: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: isSelectedCategory(index)
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: isSelectedCategory(index)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.10
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.09,
                                        width: 7,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        listCat?[index].name ?? '',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor,
                                            letterSpacing: -0.17,
                                            overflow: TextOverflow.visible),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: listCat?.length ?? 0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Expanded(
                    flex: 8,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.yellow,
                                child: Text(listCatOnCat?[index].name??'')),
                          );
                        },
                        itemCount: listCatOnCat?.length??0,
                    )
                )
              ]),
            )
          ],
        );
      },
    );
  }

  void buildCategories() async {
    listCat = await viewModel.getAllSubCategories();
  }

  void buildCategoriesOnCategory(String id) async {
    listCatOnCat = await viewModel.getSubCategoriesOnCategory(id);
  }

  bool isSelectedCategory(int index) {
    return currentIndex == index;
  }
}
