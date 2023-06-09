import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geexclub/pages/all_achieves.dart';
import 'package:geexclub/pages/all_discounts.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({Key? key}) : super(key: key);

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}
Widget productsCard() {
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
                            borderRadius: BorderRadius.all(Radius.circular(
                                4.0)),
                            child: Container(
                              width: 46.0,
                              height: 32.0,
                              color: Colors.white,
                              child: Image.asset(
                                  'assets/images/Mastercard.png'),
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
Widget form(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Информация', style: TextStyle(
        fontSize: 18,
        fontFamily: 'Arial',
        fontWeight: FontWeight.w700,
        color: Colors.white
      ),),
      SizedBox(height: 12,),
      Text('Номер телефона', style: TextStyle(
        color: Colors.white70,
        fontFamily: 'Arial',
        fontWeight: FontWeight.w400,
        fontSize: 12
      ),),
      SizedBox(height: 7),
      Text('073-23-432-41', style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Arial',
        fontWeight: FontWeight.w400
      ),),
      SizedBox(height: 12),
      Text('Реферальный код', style: TextStyle(
          color: Colors.white70,
          fontFamily: 'Arial',
          fontWeight: FontWeight.w400,
          fontSize: 12
      ),),
      SizedBox(height: 7),
      Row(
        children: [
          Text('ZXY767682USMA', style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Arial',
            fontWeight: FontWeight.w400
          ),),
          SizedBox(width: 200,),
          SvgPicture.asset('assets/images/icons/share.svg'),
          SizedBox(width: 17,),
          SvgPicture.asset('assets/images/icons/copy.svg')
        ],
      ),
      SizedBox(height: 26),
      productsCard()
    ],
  );
}
Widget balance(){
  List<String> clubs = ['GamePlace1', 'GamePlace2','GamePlace3'];
  List<String> discounts = ['15%','20%','50%'];
  List<String> balance = ['6 900','5 000', '7 000'];
  List<String> dates = ['15.02.2023','16.02.2023','17.02.2023'];
  return ScrollConfiguration(
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
  );
}
Widget achieves(){
  List<String> achieves = ['Достижение1','Достижение2','Достижение3','Достижение4',
  'Достижение5','Достижение6'];
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30
    ),
    itemCount: achieves.length,
    itemBuilder: (context, index){
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff1F1F28)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/images/icons/achieve.svg', fit: BoxFit.cover,),
            Text('${achieves[index]}')
          ],
        ),
      );
    },
  );
}



  List<Widget> tabBarWidgets = [form(), balance(), achieves()];
  List<String> items = ['Анкета', 'Баланс', 'Достижения'];
  List<String> cards = ["**** 5011","**** 5012","**** 5013","**** 5014","**** 5015"];
  int current = 0;
List<String> textForButton = ["Редактировать", 'Показать все', 'Показать все'];
class _ProfilePage2State extends State<ProfilePage2> {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF18171E),
      body: Container(
        width: media.width,
        height: media.height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/profilePage.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                padding: EdgeInsets.only(top: 29, left: 23),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                    Text('Алина Штирлиц', style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w700
                    )),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    padding: EdgeInsets.only(
                                        left: 12, right: 12),
                                    height: 26,
                                    decoration: BoxDecoration(
                                        color: current == index
                                            ? Color(0xffEF3F54)
                                            : Color(0xff1F1F28),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Text(
                                        items[index],
                                        style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        height: 225,
                        child: tabBarWidgets[current],
                      ),
                    ),
                    SizedBox(height: 24),
                    //Сделать виджет button доступным для переиспользования
                    Container(
                      height: 54,
                      width: double.infinity,
                      margin: EdgeInsets.only(right: 23),
                      decoration: BoxDecoration(
                        color: Color(0xffEF3F54),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Color(0xffEF3F54),
                        ),
                        onPressed: () {
                          if(current == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>AllDiscountsPage()));
                          }
                          else if(current == 2){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>AllAchievesPage()));
                          }
                        },
                        child: Text("${textForButton[current]}", style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Arial'
                        )),
                      ),
                    ),
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
