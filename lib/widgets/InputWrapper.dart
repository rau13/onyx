import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geexclub/pages/NavigationPage.dart';
import 'package:geexclub/pages/PasswordResetPage.dart';
import 'package:geexclub/pages/ProfilePage.dart';
import 'package:geexclub/pages/SignUpPage.dart';
import 'package:geexclub/widgets/CheckBox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatefulWidget {

  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  bool _checked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth  = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Align(alignment: Alignment.centerLeft, child:
            Text("Вход", style: TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.w700, fontFamily: 'Arial'),),),
          SizedBox(height: 15,),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:  Color(0xff1F1F28),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 329,
                          height: 50,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "Логин",
                                hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:  Color(0xff1F1F28),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 329,
                          height: 50,
                          child: TextField(
                            controller: passwordController,
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
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                focusColor: Colors.lightBlue,
                activeColor: Color(0xffEF3F54),
                value: _checked,
                onChanged: (newValue) {
                  setState(() {
                    _checked = (newValue)!;
                  });
                },
              ),
              SizedBox(height: 26),
              Text('Запомнить пароль', style: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),)
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>  PasswordReset()) ),
            child: Text(
              "Забыли пароль?",
              style: TextStyle(color: Color(0xffEF3F54), fontWeight: FontWeight.w400, fontFamily: 'Arial'),
            ),
          ),
          SizedBox(height: 95,),
        Container(
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
            onPressed:  () async {
              try{
                await auth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  NavigationPage()));
              }catch(e){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString()))
                );
              }
            },
            child: Text("Войти",style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Arial'
            ),),
          ),
        ),
          SizedBox(height: 10),
          Align(alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Text("Нет аккаунта?", style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Arial', fontWeight: FontWeight.w400),),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage())),
                child: Text(" Зарегистрируйтесь", style: TextStyle(color: Color(0xffEF3F54), fontSize: 14, fontFamily: 'Arial', fontWeight: FontWeight.w400),))
          ],))
        ],
      ),
    );
  }
}