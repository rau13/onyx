import 'package:flutter/material.dart';
import 'package:geexclub/widgets/Button.dart';

class PaidForClubPage extends StatefulWidget {
  String seat;
  String data;
  String clubName;
   PaidForClubPage({Key? key, required this.seat, required this.data, required this.clubName}) : super(key: key);

  @override
  State<PaidForClubPage> createState() => _PaidForClubPageState(this.seat, this.data, this.clubName);
}

class _PaidForClubPageState extends State<PaidForClubPage> {
  String seat;
  String data;
  String clubName;
  _PaidForClubPageState(this.seat, this.data, this.clubName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
        title: const Text('ONYX'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 22, top: 40, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Оплачено', style: TextStyle(
              color: Colors.white,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w700,
              fontSize: 36,
            )),
              SizedBox(height: 15),
              Container(
                width: 370,
                height: 220,
                decoration: BoxDecoration(
                    color: Color(0xff1F1F28),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$clubName', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w700
                      ),),
                      Text('Дата', style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial'
                      )),
                      Text('$data', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 12),
                      Text('Место', style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial'
                      )),
                      Text('$seat', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),),
                      Divider(
                        height: 30.0,
                        thickness: 1.0,
                        color: Colors.white,
                        indent: 5.0,
                        endIndent: 10.0,
                      ),
                      Text('Итого', style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial'
                      )),
                      Text('6 900 тг', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                child: Text('Vestibulum ullamcorper orci amet, luctus hac mauris eget in leo. '
                    'Id amet aliquam montes, sit libero. Gravida et nam sed urna. '
                    'Lacus ut nisi, cursus facilisi egestas. '
                    'Faucibus enim massa fermentum vestibulum, habitant.', style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arial',
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
              ),
              SizedBox(height: 24),
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
                  onPressed:  () => {},
                  child: Text("Открыть меню",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Arial'
                  ),),
                ),
              ),
            ]),
      ),
    );
  }
}
