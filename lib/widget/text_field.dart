import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {

  final TextEditingController? controller;
  final String fieldTitle;
  // final String? hintText;
  // bool? isObscure = true;
      bool? isNumber = false;

  CustomTextField(
      {
        this.controller,
        required this.fieldTitle,
        // this.hintText,
         this.isNumber
        // this.isObscure
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldTitle, style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff26A17B),),),
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -8,
                  blurRadius: 10,
                )
              ]
            ),
            padding: const EdgeInsets.all(8.0),
           // margin: const EdgeInsets.all(10),
            child: TextFormField(

              controller: controller,
              keyboardType: isNumber == true ?TextInputType.number: null,
              cursorColor: Theme.of(context).primaryColor,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusColor: Color(0xff26A17B),
              ),
            ),

          ),
        ],
      ),
    );
  }
}

