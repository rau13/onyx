import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormTabBar extends StatefulWidget {
  const FormTabBar({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  List<String> cards = ["**** 5011","**** 5012","**** 5013","**** 5014","**** 5015"];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text('Информация'),
        Text('Номер телефона'),
        Text('Реферальный код'),
        Row(
          children: [
            Text('ZXY767682USMA'),
            SvgPicture.asset('assets/images/icons/share.svg'),
            SvgPicture.asset('assets/images/icons/copy.svg')
          ],
        ),
        Text('Карты'),
        productsCard()
      ],
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
