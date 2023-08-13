import 'package:e_commerce/ui/sign_in/sign_in_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custom_authentication_textField.dart';
import '../../components/custom_elevatedButton.dart';
import '../../provider/authentication_provider.dart';
import '../../utilities/dialog_utils.dart';
import '../../utilities/validation_utils.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "sign_in_screen";
  TextEditingController userNameController =
      TextEditingController(text: 'yousef01026283799@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'yousefahmedkamel137');

  final _formKey = GlobalKey<FormState>();
  var viewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SignInViewModel, SignInViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          DialogUtils.hideDialog(context);
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
          DialogUtils.showMessageDialog(
              context, state.failMessage ?? 'something went wrong');
        } else if (state is LoadingState) {
          DialogUtils.loadingDialog(context);
        } else if (state is SuccessState) {
          AuthenticationProvider provider = BlocProvider.of(context);
          provider.login(LoggedInState(
              user: state.response.user!, token: state.response.token!));
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      buildWhen: (previous, current) {
        if (current is InitialState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: height * 0.08),
                    SvgPicture.asset("assets/route.svg"),
                    SizedBox(height: height * 0.05),
                    Text("Welcome Back To Route",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: height * 0.02),
                    Text("Please sign in with your mail",
                        style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(height: height * 0.05),
                    CustomAuthenticationTextField(
                        labelText: "User Name",
                        hintText: "enter your name",
                        isPasswordTextField: false,
                        controller: userNameController,
                        validator: validateUserNameTextField),
                    SizedBox(height: height * 0.05),
                    CustomAuthenticationTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                        isPasswordTextField: true,
                        controller: passwordController,
                        validator: validatePasswordTextField),
                    SizedBox(height: height * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ForgotPasswordScreen.routeName);
                      },
                      child: Text("Forgot password",
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.end),
                    ),
                    SizedBox(height: height * 0.06),
                    CustomElevatedButton(
                        elevatedButtonText: "Login",
                        elevatedButtonFunction: signIn),
                    SizedBox(height: height * 0.04),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text("Don’t have an account? Create Account",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 17),
                            textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void signIn() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signIn(
        userNameController.text.trim(), passwordController.text.trim());
  }

  String? validateUserNameTextField(String value) {
    if (value!.isEmpty) {
      return 'Please a Enter Email';
    }
    if (ValidationUtils.isValidateUserName(value) == true) {
      return 'Please a Enter Valid Email';
    }
    return null;
  }

  String? validatePasswordTextField(String value) {
    if (ValidationUtils.isValidatePassword(value!) == true) {
      return 'Please a Enter Password';
    }
    if (value.length < 6) {
      return 'password should be at least 6 characters';
    }
    return null;
  }
}
