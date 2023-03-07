import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tether/authentication/activation_screen.dart';
import 'package:tether/authentication/auth_screen.dart';
import 'package:tether/global/constants.dart';
import 'package:tether/global/global.dart';
import 'package:tether/tether_sender_page/bep_screen.dart';
import 'package:tether/tether_sender_page/erc_screen.dart';
import 'package:tether/tether_sender_page/omni_screen.dart';
import 'package:tether/tether_sender_page/trc_screen.dart';
import 'package:tether/widget/click_card.dart';
import 'package:tether/widget/error_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final Uri _url = Uri.parse('https://fakeusdtsender.com/product/fake-tether-usdt-sender-software-activation-code/');
  final String _phone ='37126482614';
  final String _message ='Hi';

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception( showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: 'Can\'t Open Page',
            );
          }));
    }
  }


  Future<void> _launchWhatsApp(@required number, @required messasge) async {
    Uri url =Uri.parse ('whatsapp://send?phone=$number&text=$messasge');
    await canLaunchUrl(url) ? launchUrl(url) :  showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: 'Can\'t open WhatsApp',
          );
        });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColorWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: headerBoxDec,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                        child: SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: globalPadding8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  titleHeader,
                                  dollarLogoAni,
                                  ElevatedButton(
                                      onPressed: () async {
                                        firebaseAuth.signOut();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) =>
                                                    const AuthScreen()));
                                      },
                                      style: signOutButtonStyle,
                                      child: signOutText),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      homeSubTitle1,
                      homeSubTitle2,
                      homeSubTitle3,
                      homeSubTitle4,
                      homeSubTitle5,
                      sizeBox20
                    ],
                  ),
                ),
              ),
              Padding(
                padding: globalPadding8,
                child: Container(
                  height: 50,
                  decoration: activationBoxDecoration,
                  child: Center(
                      child: sharedPreferences!.getString('actCode')! == '0' && (sharedPreferences!.getString('actCode')!) != null
                          ? notActivated
                          : accountActivated),
                ),
              ),
              ClickCard(
                headerOne: 'SEND USDT',
                headerTwo: 'Trc-20',
                data: Iconsax.money_send4,
                ontap: () {
                  if (sharedPreferences!.getString('actCode')! ==
                      sharedPreferences!.getString('uid')!) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const TrcScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const ActivationScreen()));
                  }
                },
              ),
              ClickCard(
                headerOne: 'SEND USDT',
                headerTwo: 'Erc-20',
                data: Iconsax.money_send4,
                ontap: () {
                  if (sharedPreferences!.getString('actCode')! ==
                      sharedPreferences!.getString('uid')!) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const ErcScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const ActivationScreen()));
                  }
                },
              ),
              ClickCard(
                headerOne: 'SEND USDT',
                headerTwo: 'Bep-20',
                data: Iconsax.money_send4,
                ontap: () {
                  if (sharedPreferences!.getString('actCode')! ==
                      sharedPreferences!.getString('uid')!) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const BepScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const ActivationScreen()));
                  }
                },
              ),
              ClickCard(
                headerOne: 'SEND USDT',
                headerTwo: 'Omni',
                data: Iconsax.money_send4,
                ontap: () {
                  if (sharedPreferences!.getString('actCode')! ==
                      sharedPreferences!.getString('uid')!) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const OmniScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const ActivationScreen()));
                  }
                },
              ),
              sharedPreferences!.getString('actCode') == '0'
                  ? ClickCard(
                      headerOne: 'ACTIVATION',
                      headerTwo: 'Code',
                      data: Iconsax.security_safe,
                      ontap: () {
                        _launchUrl();
                      },
                    )
                  : Container(),
              ClickCard(
                  headerOne: 'CONTACT US',
                  headerTwo: '',
                  data: Iconsax.sms4,
                  ontap: () {
                    _launchWhatsApp(_phone,_message);
                  }),
              sizeBox10
            ],
          ),
        ),
      ),
    );
  }
}
