import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ClickCard extends StatelessWidget {
 final String headerOne;
 final String headerTwo;
 final IconData data;
 final Function()? ontap;

 ClickCard({required this.headerOne, required this.headerTwo, required this.data, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap ,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0, top: 2.0, bottom: 2.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: SizedBox(
            height: 60 ,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
               Icon(data, size: 50, color: const  Color(0xff26A17B), ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(headerOne, style: const TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: Color(0xff26A17B)),),
                    Text(headerTwo, style: TextStyle(fontSize: 20,color: Colors.grey[600]),),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}