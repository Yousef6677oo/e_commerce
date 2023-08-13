import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_authentication_textField.dart';
import '../../components/custom_elevatedButton.dart';
import '../../utilities/dialog_utils.dart';
import '../../utilities/validation_utils.dart';
import '../sign_in/sign_in_screen.dart';
import 'forgot_password_viewModel.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var viewModel = ForgotPasswordViewModel();
  final _formKey = GlobalKey<FormState>();
  States currentState = States.enterEmailState;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ForgotPasswordViewModel, ForgotPasswordViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (previous is LoadingState) {
          DialogUtils.hideDialog(context);
        }
        if (current is SuccessEmailState ||
            current is SuccessResetCodeState ||
            current is SuccessResetPasswordState ||
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
        } else if (state is SuccessEmailState) {
          currentState = States.enterVerificationCode;
        } else if (state is SuccessResetCodeState) {
          currentState = States.enterNewPassword;
        } else if (state is SuccessResetPasswordState) {
          Navigator.pushNamed(context, SignInScreen.routeName);
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
          body: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.08),
                  SvgPicture.asset("assets/route.svg"),
                  SizedBox(height: height * 0.1),
                  buildCurrentTextField(),
                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomElevatedButton(
                        elevatedButtonText: 'Send',
                        elevatedButtonFunction: send),
                  ),
                  SizedBox(height: height * 0.3),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      child: Text("Back to sign in",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center)),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCurrentTextField() {
    if (currentState == States.enterEmailState) {
      return Column(
        children: [
          Text("Enter Email Address",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 22),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomAuthenticationTextField(
                labelText: '',
                hintText: 'example@gmail.com',
                isPasswordTextField: false,
                controller: emailController,
                validator: validateEmailTextField),
          ),
        ],
      );
    } else if (currentState == States.enterVerificationCode) {
      return Column(
        children: [
          Text("Enter Verification Code",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 22),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomAuthenticationTextField(
                labelText: '',
                hintText: 'Enter Verification Code here',
                isPasswordTextField: false,
                controller: verificationCodeController,
                validator: validateVerificationCodeField),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text("Enter New Password",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 22),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomAuthenticationTextField(
                labelText: '',
                hintText: 'password should be at least 6 characters',
                isPasswordTextField: false,
                controller: passwordController,
                validator: validatePasswordTextField),
          ),
        ],
      );
    }
  }

  String? validateEmailTextField(String value) {
    if (value!.isEmpty) {
      return 'Please a Enter Email';
    }
    if (ValidationUtils.isValidateUserName(value) == true) {
      return 'Please a Enter Valid Email';
    }
    return null;
  }

  String? validateVerificationCodeField(String value) {
    if (ValidationUtils.isValidateVerificationCode(value!) == true) {
      return 'Please a Enter Verification Code';
    }
    if (value.length < 5) {
      return 'password should be at least 5 number';
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

  void send() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    if (currentState == States.enterEmailState) {
      viewModel.forgotPassword(emailController.text);
    }
    if (currentState == States.enterVerificationCode) {
      viewModel.verifyResetCode(verificationCodeController.text);
    }
    if (currentState == States.enterNewPassword) {
      viewModel.resetPassword(emailController.text, passwordController.text);
    }
  }
}

enum States {
  enterEmailState,
  enterVerificationCode,
  enterNewPassword;
}
