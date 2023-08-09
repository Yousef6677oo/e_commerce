import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/app_colors.dart';

class CustomAccountTextField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  String hintText;
  bool isPasswordTextField;

  //Function validator;

  CustomAccountTextField({
    required this.labelText,
    required this.hintText,
    required this.isPasswordTextField,
    required this.controller,
  });

  @override
  State<CustomAccountTextField> createState() => _CustomAccountTextFieldState();
}

class _CustomAccountTextFieldState extends State<CustomAccountTextField> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: const Color(0xff06004F)),
          ),
          SizedBox(height: height * 0.015),
          TextFormField(
            // validator: (value) {
            //   return widget.validator(value);
            // },
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.17,
                color: Color(0xff06004F)),
            obscureText: widget.isPasswordTextField,
            showCursor: false,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: SvgPicture.asset("assets/edit_icon.svg"),
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.17,
                  color: Color(0xff06004F)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xff004182)),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xff004182)),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xff004182)),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              filled: true,
              fillColor: AppColors.accentColor,
            ),
          )
        ],
      ),
    );
  }
}
