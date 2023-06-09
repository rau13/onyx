import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text("ONYX", style:GoogleFonts.bebasNeue(fontSize: 92.6, color: Colors.white)),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}