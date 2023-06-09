import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geexclub/pages/ReservationPage.dart';
import 'package:geexclub/widgets/Button.dart';

class ClubDetails extends StatefulWidget {
  String clubName;
  ClubDetails({Key? key, required this.clubName}) : super(key: key);

  @override
  State<ClubDetails> createState() => _ClubDetailsState(this.clubName);
}

class _ClubDetailsState extends State<ClubDetails> {

  String clubName;
  _ClubDetailsState(this.clubName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
        title: const Text('ONYX'),
      ),
      backgroundColor: Color(0xFF18171E),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image:  DecorationImage(
                        image: AssetImage('assets/images/clubImg1.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
            ),
            Positioned(
                top: 200,
                child: Container(
                  padding: EdgeInsets.only(top: 29, left: 23),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Color(0xFF18171E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$clubName', style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w700
                      )),
                      SizedBox(height: 32,),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/icons/PC.svg'),
                          SizedBox(width: 14),
                          Text('PC - 61', style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arial',
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          )),
                          SizedBox(width: 30),
                          SvgPicture.asset('assets/images/icons/PS.svg'),
                          SizedBox(width: 14),
                          Text('PS - 6', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                          )),
                        ],
                      ),
                      SizedBox(height: 36),
                      Text('Цена за час', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      )),
                      Text('от 400 тг', style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'
                      )),
                      SizedBox(height: 24),
                      Text('Адрес', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                      )),
                      Text('майдан Незалежності, 3, Рівне, Рівненська область, 33000', style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial'
                      )),
                      SizedBox(height: 24),
                      Text('Мобильный телефон', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                      )),
                      Text('34457986967867', style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial'
                      )),
                      SizedBox(height: 54),
                      //Сделать виджет button доступным для переиспользования
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
                          onPressed:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationPage(clubName: clubName,))),
                          child: Text("Забронировать",style: TextStyle(
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
            ),
          ],
        ),
      )
    );
  }
}
