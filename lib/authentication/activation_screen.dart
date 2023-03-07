import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:tether/global/global.dart';
import 'package:tether/home_page.dart';
import 'package:tether/widget/click_Card_square.dart';
import 'package:tether/widget/error_dialog.dart';
import 'package:tether/widget/loadingdialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/custom_text_field.dart';

class ActivationScreen extends StatefulWidget {
  const ActivationScreen({Key? key}) : super(key: key);

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController activationController = TextEditingController();
  final Uri _url = Uri.parse(
      'https://fakeusdtsender.com/product/fake-tether-usdt-sender-software-activation-code/');


  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

 void activateApp()async{
    if(activationController.text.isNotEmpty){
      if(sharedPreferences!.getString('uid')! == activationController.text.trim()){
        showDialog(
            context: context,
            builder: (c){
              return LoadingDialog(
                message: "Checking Code",
              );
            });
        await sharedPreferences!.setString('actCode', activationController.text.trim());
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> const HomePageScreen()));
      }else{
        showDialog(
            context: context,
            builder: (c){
              return ErrorDialog(
                message: "Invalid Code",
              );
            });
      }
    }else{
      showDialog(
          context: context,
          builder: (c){
            return ErrorDialog(
              message: "please Input Code",
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('jsonAssets/dollar.json', height: 200, width: 200),
            const Text(
              "ACTIVATE ACCOUNT",
              style: TextStyle(
                  color: Color(0xff26A17B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: CustomTextField(
                data: Icons.lock,
                hintText: 'activation code',
                controller: activationController,
                enabled: true,
                isObscure: false,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SquareCard(
                  title: 'Activate',
                  icon: Iconsax.lamp_on4,
                  ontap: () {
                  activateApp();
                  },
                ),
                SquareCard(
                  title: 'Buy Code',
                  icon: Iconsax.money_send4,
                  ontap: () {
                   _launchUrl();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
