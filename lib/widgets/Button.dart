import 'package:flutter/material.dart';
import 'package:geexclub/pages/NavigationPage.dart';

class Button extends StatelessWidget{

  final String buttonName;

  Button({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 54,
      width: 329,
      decoration: BoxDecoration(
        color: Color(0xffEF3F54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Color(0xffEF3F54),
        ),
        onPressed:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationPage())),
        child: Text("$buttonName",style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Arial'
        ),),
      ),
    );
  }
}