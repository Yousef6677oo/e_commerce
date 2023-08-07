import 'package:e_commerce/provider/authentication_provider.dart';
import 'package:e_commerce/ui/account/account_screen.dart';
import 'package:e_commerce/ui/categories/categories_screen.dart';
import 'package:e_commerce/ui/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/ui/home/home_screen.dart';
import 'package:e_commerce/ui/sign_in/sign_in_screen.dart';
import 'package:e_commerce/ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:e_commerce/utilities/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) {
        return AuthenticationProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce App',
      theme: AppThemes.theme,
      initialRoute: SignInScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
        CategoriesScreen.routeName: (_) => CategoriesScreen(),
        WishlistScreen.routeName: (_) => WishlistScreen(),
        AccountScreen.routeName: (_) => AccountScreen()
      },
    );
  }
}
