import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {

  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  bool? isObscure = true;
  bool? enabled = true;


  CustomTextField(
      {
        this.controller,
        this.data,
        this.hintText,
        this.enabled,
        this.isObscure
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0x1f419A95),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isObscure!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              data,
              color: const Color(0xff26A17B),
            ),

            focusColor: Theme.of(context).primaryColor,
            hintText: hintText
        ),
      ),

    );
  }
}

