import 'package:e_commerce/provider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_account_textField.dart';

class AccountTab extends StatelessWidget {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider provider = BlocProvider.of(context);

    fullNameController = TextEditingController(text: provider.user.name);
    emailController = TextEditingController(text: provider.user.email);
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.06),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset("assets/route_leading_icon.svg")
            ],
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Welcome, ${provider.user.name?.split(" ").elementAt(0)}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: const Color(0xff06004F)),
            ),
          ),
          SizedBox(height: height * 0.015),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("${provider.user.email}",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0x7e06004f))),
          ),
          SizedBox(height: height * 0.04),
          CustomAccountTextField(
            labelText: 'Your full name',
            hintText: '',
            isPasswordTextField: false,
            controller: fullNameController,
          ),
          CustomAccountTextField(
            labelText: 'Your E-mail',
            hintText: '',
            isPasswordTextField: false,
            controller: emailController,
          ),
          CustomAccountTextField(
            labelText: 'Your password',
            hintText: "**********************",
            isPasswordTextField: true,
            controller: passwordController,
          ),
          CustomAccountTextField(
            labelText: 'Your mobile number',
            hintText: 'edit your mobile number here',
            isPasswordTextField: false,
            controller: mobileController,
          ),
        ],
      ),
    );
  }
}
