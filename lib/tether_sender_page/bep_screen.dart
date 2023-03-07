import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tether/global/global.dart';
import 'package:tether/widget/click_Card_square.dart';
import 'package:tether/widget/error_dialog.dart';
import 'package:tether/widget/loadingdialog.dart';
import 'package:tether/widget/loadingdone.dart';
import 'package:tether/widget/text_field.dart';

class BepScreen extends StatefulWidget {
  const BepScreen({Key? key}) : super(key: key);

  @override
  _BepScreenState createState() => _BepScreenState();
}

class _BepScreenState extends State<BepScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController activationController = TextEditingController();
  TextEditingController walletController = TextEditingController();
  TextEditingController amountController = TextEditingController();


  verification(){
    if(activationController.text.isNotEmpty){
      if(sharedPreferences!.getString('uid')! == activationController.text.trim() && walletController.text.isNotEmpty && amountController.text.isNotEmpty){
        showDialog(
            context: context,
            builder: (c){
              return LoadingDialog(
                message: "Sending USDT",
              );
            }).timeout(const Duration(seconds:3),onTimeout: (){
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (c){
                return LoadingDone(
                  message: "Sent",
                );
              }).timeout(const Duration(seconds:3),onTimeout:()=>  Navigator.pop(context));
        });
        activationController.clear();
        amountController.clear();
        walletController.clear();


      }else{
        showDialog(
            context: context,
            builder: (c){
              return ErrorDialog(
                message: "please Fill required fields",
              );
            });
      }
    }else{
      showDialog(
          context: context,
          builder: (c){
            return ErrorDialog(
              message: "Add Activation Code",
            );
          });
    }
  }




  @override
  Widget  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Fake USDT Sender",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                color: const Color(0xff26A17B),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                          text: 'Warning:',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                          children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                text:
                                'Sending Erc20 to an Trc20 wallet will not reflect ')
                          ]),
                    ),
                  ),
                ),
              ),
             const SizedBox(height: 20,),
              CustomTextField(
                fieldTitle: 'Activation Code',
                controller: activationController,
              ),
              CustomTextField(
                fieldTitle: 'Wallet Address',
                controller: walletController,
              ),
              CustomTextField(
                fieldTitle: 'Amount (USDT)',
                controller: amountController,
                isNumber: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SquareCard(
                    title: 'BUY\nACTIVATION\nCODE',
                    icon: Iconsax.security_safe,
                    ontap: (){

                    },
                  ),
                  SquareCard(
                    title: 'SEND USDT\nErc20',
                    icon: Iconsax.money_send4,
                    ontap: (){
                    // Todo add action
                      verification();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
