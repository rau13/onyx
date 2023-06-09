import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widgets/Header.dart';
import '../widgets/InputWrapper.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(376, 812),
        builder: (context, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/LoginPageBG.png'),
                    repeat: ImageRepeat.repeat,
                    fit: BoxFit.contain,
                  ),
                  color: Color(0xff1F1F28)
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 100,),
                  Header(),
                  Expanded(child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff18171E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )
                    ),
                    child: InputWrapper(),
                  ))
                ],
              ),
            ),
          );
        }
    );
  }}