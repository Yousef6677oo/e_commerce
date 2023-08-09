import 'package:e_commerce/ui/sign_up/sign_up_viewModel.dart';
import 'package:e_commerce/utilities/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_authentication_textField.dart';
import '../../components/custom_elevatedButton.dart';
import '../../provider/authentication_provider.dart';
import '../../utilities/validation_utils.dart';
import '../home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "sign_up_screen";
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var viewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SignUpViewModel, SignUpViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          Navigator.pop(context);
        }
        if (current is LoadingState ||
            current is SuccessState ||
            current is FailState) {
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
                    SizedBox(height: height * 0.06),
                    CustomAuthenticationTextField(
                        labelText: "Full Name",
                        hintText: "enter your full name",
                        isPasswordTextField: false,
                        controller: fullNameController,
                        validator: validateFullNameTextField),
                    SizedBox(height: height * 0.035),
                    CustomAuthenticationTextField(
                        labelText: "Mobile Number",
                        hintText: "enter your mobile no.",
                        isPasswordTextField: false,
                        controller: mobileNumberController,
                        validator: validateMobileNumberTextField),
                    SizedBox(height: height * 0.035),
                    CustomAuthenticationTextField(
                        labelText: "E-mail address",
                        hintText: "enter your email address",
                        isPasswordTextField: false,
                        controller: emailAddressController,
                        validator: validateUserNameTextField),
                    SizedBox(height: height * 0.035),
                    CustomAuthenticationTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                        isPasswordTextField: true,
                        controller: passwordController,
                        validator: validatePasswordTextField),
                    SizedBox(height: height * 0.06),
                    CustomElevatedButton(
                        elevatedButtonText: "Sign up",
                        elevatedButtonFunction: signUp),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void signUp() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signUp(fullNameController.text, mobileNumberController.text,
        emailAddressController.text.trim(), passwordController.text.trim());
  }

  String? validateFullNameTextField(String value) {
    if (ValidationUtils.isValidateFullName(value!) == true) {
      return 'Please a Enter Full Name';
    }
    if (value.length < 6) {
      return 'Please a Enter Valid Full Name';
    }
    return null;
  }

  String? validateMobileNumberTextField(String value) {
    if (ValidationUtils.isValidateMobileNumber(value!) == true) {
      return 'Please a Enter Mobile Number';
    }
    if (value.length < 6) {
      return 'Please a Enter Mobile Number';
    }
    return null;
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
