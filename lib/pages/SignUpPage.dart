import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geexclub/pages/NavigationPage.dart';
import 'package:geexclub/widgets/Button.dart';
import 'package:geexclub/widgets/CheckBox.dart';
import 'package:geexclub/widgets/InputField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _checked = false;
  Color buttonColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: Color(0xff18171E),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Регистрация',
                style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700, fontFamily: 'Arial'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color:  Color(0xff1F1F28),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child:  Padding(
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
                                            hintText: "ФИО",
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
                          SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color:  Color(0xff1F1F28),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:  Padding(
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
                          SizedBox(height: 30.0),
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
                          SizedBox(
                            height: 40,
                          ),
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
                                buttonColor = Color(0xffEF3F54);
                              });
                            },
                          ),
                              Text('Принимаю', style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w400
                              ),),
                              TextButton(
                                onPressed: (){

                                },
                                child: Text('условия использования', style: TextStyle(
                                color: Color(0xffEF3F54),
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w400
                              ),)
                              )],
                          ),
                          SizedBox(height: 150),
                Container(
                  height: 54,
                  width: 329,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: buttonColor,
                    ),
                    onPressed:  _checked ? () async {
                      try {
                        final newUser = await auth
                            .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        if (newUser != null) {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => const NavigationPage()));
                        }
                      } catch (e) {
                        print(e);
                      }
                    } : null,
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
