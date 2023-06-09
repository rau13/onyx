import 'package:flutter/material.dart';

class InputField extends StatelessWidget{

  final String value1;
  final String value2;

  InputField({super.key, required this.value1, required this.value2});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color:  Color(0xff1F1F28),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 16, left: 16),
                  child: Image.asset('$value2')),
              Expanded(
                child: SizedBox(
                  width: 329,
                  height: 53,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "$value1",
                        hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}