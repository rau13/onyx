import 'package:flutter/material.dart';
class AllDiscountsPage extends StatefulWidget {
  const AllDiscountsPage({Key? key}) : super(key: key);

  @override
  State<AllDiscountsPage> createState() => _AllDiscountsPageState();
}

class _AllDiscountsPageState extends State<AllDiscountsPage> {
  List<String> clubs = ['GamePlace1', 'GamePlace2','GamePlace3'];
  List<String> discounts = ['15%','20%','50%'];
  List<String> balance = ['6 900','5 000', '7 000'];
  List<String> dates = ['15.02.2023','16.02.2023','17.02.2023'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
      ),
      backgroundColor: Color(0xFF18171E),
      body: Container(
        padding: EdgeInsets.all(23),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
              itemCount: clubs.length,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1F1F28)
                  ),
                  height: 91,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${clubs[index]}', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Баланс', style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),),
                          SizedBox(width: 10,),
                          Text('Скидка', style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),),
                          Text('Последнее посещение', style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${balance[index]}', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                          ),),
                          Text('${discounts[index]}', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                          ),),
                          Text('${dates[index]}', style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                          ),)
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
