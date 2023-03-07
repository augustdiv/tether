import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tether/authentication/auth_screen.dart';
import 'package:tether/global/constants.dart';
import 'package:tether/global/global.dart';
import 'package:tether/home_page.dart';
import 'package:tether/widget/error_dialog.dart';
import 'package:tether/widget/loadingdialog.dart';
import '../widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      //login
      logInNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "please Write email/password",
            );
          });
    }
  }

  logInNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingDialog(
            message: "Checking Credentials",
          );
        });
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      currentUser = auth.user!;
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
      readDataAndSetDataLocally(currentUser!);
      Navigator.pop(context);
      // send the user to homePage
      Route newRoute =
          MaterialPageRoute(builder: (c) => const HomePageScreen());
      Navigator.pushReplacement(context, newRoute);
      // }
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        await sharedPreferences!.setString('uid', currentUser.uid);
        await sharedPreferences!.setString('actCode', '0').then((c){
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const AuthScreen()));
        });

      } else {
        firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));

        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(message: 'Account don\'t exist');
            });
      }
    });
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
                decoration: headerBoxDec,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: globalPadding8,
                        child: authTitleH,
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
              sizeBox30,
              Row(
                children: [
                  Padding(padding: globalPadding10, child: logInText),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: appLogo,
                  ),
                ],
              ),
              sizeBox10,
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        data: Icons.email,
                        controller: emailController,
                        hintText: 'Email',
                        enabled: true,
                        isObscure: false,
                      ),
                      CustomTextField(
                        data: Icons.lock,
                        hintText: 'PassWord',
                        controller: passwordController,
                        enabled: true,
                        isObscure: true,
                      ),
                    ],
                  )),
              sizeBox10,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff26A17B),
                ),
                onPressed: () {
                  formValidation();
                },
                child: const Text("Proceed"),
              ),
              sizeBox10
            ],
          ),
        ),
      ),
    );
  }
}
