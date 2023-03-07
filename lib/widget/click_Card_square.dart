import 'package:flutter/material.dart';

class SquareCard extends StatelessWidget {
   final String title;
   final IconData icon;
   Function() ontap;

   SquareCard({
      required this.title,
     required this.icon,
     required this.ontap
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xff26A17B),size: 50,),
            SizedBox(height: 10,),
            Container(
              child: Center(
                child: Text(
                  title, style:const TextStyle(
                  color:  Color(0xff26A17B),
                  fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
