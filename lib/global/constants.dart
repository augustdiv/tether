
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


var bgColor = const Color(0xff26A17B);
var textColor = const Color(0xff26A17B);
var bgColorWhite = const Color(0xfff5f5f5);

var appLogo = Image.asset('assets/logo.png');

var authTitleH = const Text('FAKE\nTETHER\nTRANFER',
  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900,color: Colors.white),);
var titleHeader =  Text(
  "FAKE USDT \nSENDER",
  style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.grey[700]),
);

var dollarLogoAni = Expanded(
  child: Lottie.asset('jsonAssets/dollar.json',
      height: 200, width: 200),
);

var homeSubTitle1 = const Padding(
  padding: EdgeInsets.only(
      top: 20.0, left: 8.0, right: 2.0, bottom: 10),
  child: Text(
    "The fake USDT generator software is used to send fake tether(USDt) to\nany wallet.",
    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  ),
);

var homeSubTitle2 = Padding(
  padding: const EdgeInsets.only(
    left: 8.0,
    right: 2.0,
  ),
  child: Row(
    children: const [
      Icon(
        Icons.check,
        color: Colors.white,
      ),
      Text(
        "All wallet Supported ",
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
    ],
  ),
);
var homeSubTitle3 = Padding(
  padding: const EdgeInsets.only(
    left: 8.0,
    right: 2.0,
  ),
  child: Row(
    children: const [
      Icon(
        Icons.check,
        color: Colors.white,
      ),
      Text(
        "All wallet Supported ",
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
    ],
  ),
);

var homeSubTitle4 = Padding(
  padding:const EdgeInsets.only(
    left: 8.0,
    right: 2.0,
  ),
  child: Row(
    children: const [
      Icon(
        Icons.check,
        color: Colors.white,
      ),
      Text(
        "Available for mobile and desktop devices",
        style: TextStyle(
            color: Colors.white, fontSize: 17),
      ),
    ],
  ),
);

var homeSubTitle5 = Padding(
  padding: EdgeInsets.only(
    left: 8.0,
    right: 2.0,
  ),
  child: Row(
    children: const [
      Icon(
        Icons.check,
        color: Colors.white,
      ),
      Text(
        "tether sent can be checked on etherscan",
        style: TextStyle(
            color: Colors.white, fontSize: 17),
      ),
    ],
  ),
);

var notActivated = const Text(
  "ACCOUNT NOT ACTIVATED",
  style: TextStyle(color: Colors.red, fontSize: 20,fontWeight: FontWeight.w700),
);

var accountActivated = const Text(
  "ACCOUNT ACTIVATED",
  style: TextStyle(color: Color(0xff26A17B), fontSize: 20,fontWeight: FontWeight.w700),
);

var globalPadding8 = const EdgeInsets.all(8.0);
var globalPadding10 = const EdgeInsets.all(10.0);
var globalPadding20 = const EdgeInsets.all(20.0);

var sizeBox5 = const SizedBox(height: 5,);
var sizeBox10 = const SizedBox(height: 10,);
var sizeBox15 = const SizedBox(height: 15,);
var sizeBox20 = const SizedBox(height: 20,);
var sizeBox25 = const SizedBox(height: 25,);
var sizeBox30 = const SizedBox(height: 30,);

var activationBoxDecoration = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: Colors.white);


var signOutText = const Text(
  'SignOut',
  style: TextStyle(color: Color(0xff26A17B)),
);

var logInText = const Text(
  'Login',
  style: TextStyle(
      color: Color(0xff26A17B),
      fontSize: 30,
      fontWeight: FontWeight.bold),
);

var signOutButtonStyle = ButtonStyle(
 // elevation: MaterialStatePropertyAll.,
  backgroundColor:
  MaterialStateProperty.all(Colors.white),
);

var headerBoxDec = const BoxDecoration(
    color: Color(0xff26A17B),
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20)));

var phoneInputDeco = const InputDecoration(
    border: InputBorder.none,
    prefixIcon:  Icon(
      Icons.phone,
      color:  Color(0xff26A17B),
    ),
    hintText: 'Phone'
);