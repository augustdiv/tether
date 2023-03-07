import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

circularProgress(){
  return Container(
    color: Colors.blue.withOpacity(0.0),
    alignment: Alignment.center,
    child: Lottie.asset('jsonAssets/liquidloader.json', height: 200, width: 200),

  );
}

checked(){
  return Container(
    color: Colors.blue.withOpacity(0.0),
    alignment: Alignment.center,
    child: Lottie.asset('jsonAssets/checked.json', height: 200, width: 200),

  );
}


linearProgress()
{
  return Container(
    alignment: Alignment.center,
    padding:const  EdgeInsets.only(top: 12.0),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.amber,
      ),

    ),

  );
}