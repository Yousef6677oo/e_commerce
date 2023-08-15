import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/model/UserDto.dart';
import 'package:e_commerce/provider/authentication_provider.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/ui/home/home_screen.dart';
import 'package:e_commerce/ui/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/utilities/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged = prefs.getBool('isLogged') ?? false;
  String name = prefs.getString('name') ?? '';
  String email = prefs.getString('email') ?? '';
  String token = prefs.getString('token') ?? '';
  ApiManager apiManager = ApiManager();
  apiManager.getAllSubCategories();
  runApp(BlocProvider(
      lazy: true,
      create: (BuildContext context) {
        return AuthenticationProvider(
            isLogged: isLogged, user: UserDto(name: name, email: email),token: token);
      },
      child: MyApp(isLogged)));
}

class MyApp extends StatelessWidget {
  final bool isLogged;

  const MyApp(this.isLogged) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce App',
      theme: AppThemes.theme,
      initialRoute: isLogged ? HomeScreen.routeName : SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
        ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
        CartScreen.routeName: (_) => CartScreen()
      },
    );
  }
}
