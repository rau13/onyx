import 'package:flutter/material.dart';
import 'package:geexclub/pages/SignInPage.dart';
import 'package:geexclub/widgets/Button.dart';
import 'package:geexclub/widgets/InputField.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF18171E),
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
        title: const Text('ONYX'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.5, left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Сброс пароля', style: TextStyle(
             color: Colors.white,
             fontSize: 32,
             fontFamily: 'Arial',
             fontWeight: FontWeight.w700
           ),),
           SizedBox(height: 26),
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
                 Expanded(
                   child: SizedBox(
                     width: 329,
                     height: 53,
                     child: TextField(
                       decoration: InputDecoration(
                           hintText: "Пароль",
                           hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                           border: InputBorder.none
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
        SizedBox(height: 50),
        Container(
          height: 54,
          width: 400,
          decoration: BoxDecoration(
            color: Color(0xffEF3F54),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Color(0xffEF3F54),
            ),
            onPressed:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
            child: Text("Продолжить",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Arial'
            ),),
          ),
        ),
         ],
        ),
      ),
    );
  }
}
