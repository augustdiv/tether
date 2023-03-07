import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tether/global/constants.dart';
import 'package:tether/global/global.dart';
import 'package:tether/home_page.dart';
import 'package:tether/widget/error_dialog.dart';
import 'package:tether/widget/loadingdialog.dart';
import 'package:tether/widget/phone_text_field.dart';

import '../widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? phoneNum;

  Future<void> formValidation() async {
    if (passwordController.text == confirmPasswordController.text) {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty) {
        showDialog(
            context: context,
            builder: (c) {
              return LoadingDialog(
                message: 'registering',
              );
            });
        //todo upload to data base
        authenticateRepAndSignUp();
      } else {
        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message:
                    'Please fill in the complete information for registration',
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: 'password don\'t march',
            );
          });
    }
  }

  void authenticateRepAndSignUp() async {
    User? currentUser;

    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        Navigator.pop(context);
        // send the user to homePage
        Route newRoute =
            MaterialPageRoute(builder: (c) => const HomePageScreen());
        Navigator.pushReplacement(context, newRoute);
      });
    }
  }

  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection("user").doc(currentUser.uid).set({
      "key": currentUser.uid,
      "Email": currentUser.email,
      "phoneNumber": phoneNum,
    });

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString('uid', currentUser.uid);
    await sharedPreferences!.setString('actCode', '0');

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                decoration: const BoxDecoration(
                  color: Color(0xff26A17B),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'FAKE\nTETHER\nTRANFER',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Hero(
                        tag: 1,
                        child: Lottie.asset('jsonAssets/dollar.json',
                            height: 400, width: 400),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(0xff26A17B),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/logo.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        data: Icons.email,
                        hintText: 'Email',
                        controller: emailController,
                        enabled: true,
                        isObscure: false,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0x1f419A95),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(10),
                        child: IntlPhoneField(
                          controller: phoneNumberController,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: phoneInputDeco,
                          onChanged: (phoneValue) {
                            setState(() {
                              phoneNum = phoneValue.completeNumber.toString();
                            });
                          },
                        ),
                      ),
                      CustomTextField(
                        data: Icons.lock,
                        hintText: 'PassWord',
                        controller: passwordController,
                        enabled: true,
                        isObscure: true,
                      ),
                      CustomTextField(
                        data: Icons.lock,
                        hintText: 'Confirm PassWord',
                        controller: confirmPasswordController,
                        enabled: true,
                        isObscure: true,
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Join"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff26A17B),
                ),
                onPressed: () {
                  // Todo
                  formValidation();
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
