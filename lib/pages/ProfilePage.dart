import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final birthDateController = TextEditingController();

  final emailController = TextEditingController();

  String name = "Ихсанов Асет";

  String birthDate = "08.12.1989";

  String phone = "073-23-432-41";

  String email = "sembat2404@gmail.com";

  List<String> cards = ["**** 5011","**** 5012","**** 5013","**** 5014","**** 5015"];

  List<String> clubs = ["Neon","Baza","Baza","Neon"];

  List<int> balance = [123,123,123,132];

  List<String> discount = ["Нет", "15%", "Нет", "20%"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 23, top: 23, right: 23),
          height: double.infinity,
          color: Color(0xFF18171E),
          child: Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text('$name', style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF7F7F7),
                        fontSize: 32.0,
                      )),
                      Text('Никнейм', style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF7F7F7),
                        fontSize: 18.0
                      )),
                      SizedBox(height: 24),
                      Text('Дата рождения', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        color: Colors.white70,
                      )),
                      SizedBox(height: 5.5),
                      Text('$birthDate', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF7F7F7),
                      ),),
                      SizedBox(height: 17.5),
                      Text('Номер телефона', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        color: Colors.white70
                      )),
                      SizedBox(height: 5.5),
                      Text('$phone', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF7F7F7),
                      )),
                      SizedBox(height: 17.5),
                      Text('Email', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          color: Colors.white70
                      )),
                      SizedBox(height: 5.5),
                      Text('$email', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF7F7F7),
                      )),
                      SizedBox(height: 17.5),
                      Text('Карты', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          color: Colors.white70
                      )),
                      SizedBox(height: 17.5),
                      productsCard(),
                      SizedBox(height: 55.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 147,
                          padding: EdgeInsets.only(top: 19, right: 19, left: 19),
                          color: Color(0xFF1F1F28),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Клубы', style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                  ),),
                                  Text('Баланс', style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14
                                  ),),
                                  Text('Скидки', style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14
                                  ),)
                                ],
                              ),
                              ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(overscroll: false),
                                child: Expanded(
                                  child: ListView.builder(
                                          itemExtent: 30,
                                          shrinkWrap: true,
                                          itemCount: clubs.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(clubs[index], style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16
                                            ),),
                                            Text(balance[index].toString(), style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16
                                            ),),
                                            Text(discount[index], style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16
                                            ),)
                                          ],
                                        );
                                      }),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color(0xFF1F1F28),
                              height: 53,
                              width: 264,
                              child: GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25)
                                          )
                                      ),
                                      backgroundColor: Color(0xff1F1F28),
                                      context: context,
                                      builder: (context){
                                        return Container(
                                          padding: EdgeInsets.only(top: 30, right: 23, left: 23,bottom: 75),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Divider(
                                                  height: 30.0,
                                                  thickness: 2.0,
                                                  color: Colors.white,
                                                  indent: 150.0,
                                                  endIndent: 150.0
                                              ),
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
                                                          controller: nameController,
                                                          decoration: InputDecoration(
                                                              hintText: "$name",
                                                              hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                                          controller: birthDateController,
                                                          decoration: InputDecoration(
                                                              hintText: "$birthDate",
                                                              hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                                          controller: phoneController,
                                                          decoration: InputDecoration(
                                                              hintText: "$phone",
                                                              hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                                          controller: emailController,
                                                          decoration: InputDecoration(
                                                              hintText: "$email",
                                                              hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial', fontWeight: FontWeight.w400),
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 54,
                                                width: 370,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffEF3F54),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    primary: Color(0xffEF3F54),
                                                  ),
                                                  onPressed:  () {
                                                    setState(() {
                                                      name = nameController.text;
                                                      phone = phoneController.text;
                                                      email = emailController.text;
                                                      birthDate = birthDateController.text;
                                                    });
                                                  },
                                                  child: Text("Редактировать",style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: 'Arial'
                                                  ),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Редактировать', style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Arial',
                                      fontSize: 18,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 53,
                                color: Color(0xFF1F1F28),
                                child: Image.asset('assets/images/icons/exit.png'),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget productsCard(){
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int i) =>
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Card(
                      child: Container(
                        color: Color(0xFF1F1F28),
                        width: 130.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              child: Container(
                                width: 46.0,
                                height: 32.0,
                                color: Colors.white,
                                child: Image.asset('assets/images/Mastercard.png'),
                              ),
                            ),
                            Text(cards.elementAt(i), style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
            )
        ),
      ),
    );
  }
}

