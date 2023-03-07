import 'package:flutter/material.dart';
import 'package:tether/widget/progress_bar.dart';

class LoadingDone extends StatelessWidget {
  String?  message;
  LoadingDone({this.message});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          checked(),
          const SizedBox(height: 10,),
          Text('$message \nSuccessfully' ,
            textAlign: TextAlign.center,
            style:const  TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
