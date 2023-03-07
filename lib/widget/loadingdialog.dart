import 'package:flutter/material.dart';
import 'package:tether/widget/progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  String?  message;
  LoadingDialog({this.message});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(height: 10,),
          Text('$message,\nPlease wait',
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
