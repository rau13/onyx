import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geexclub/pages/PaidForClubPage.dart';
import 'package:geexclub/widgets/Button.dart';
import 'package:geexclub/widgets/CustomCalendar.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationPage extends StatefulWidget {
  String clubName;
  ReservationPage({Key? key, required this.clubName}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState(this.clubName);

}

class _ReservationPageState extends State<ReservationPage> {
   String clubName;
  _ReservationPageState(this.clubName);
   static List<Color> colors = [Colors.white, Color(0xff787878)];

   int checkedIndex = 0;

   int checkedSeat = 0;

   String time = "";


  final ItemScrollController _itemScrollController = ItemScrollController();
  Color datePickerColor = Color(0xFF1F1F28);
  Color timePickerColor = Color(0xFF1F1F28);
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
   CalendarFormat _calendarFormat = CalendarFormat.month;
  // This function will be triggered when the user presses the floating button
  void _scrollToIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  List<String> rooms = ["Обычный", "VIP", "Gold"];

  List<int> seats = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35];

  int indexOfRooms = 0;

  void nextItemIndex(){
    if(indexOfRooms == 2){
      indexOfRooms = 0;
    }else{
      indexOfRooms++;
    }
  }

  void backItem(){
    if(indexOfRooms != 0){
      indexOfRooms--;
    }else{
      indexOfRooms = 2;
    }


  }
   void _OnDaySelected(DateTime day, DateTime focusedDay){
      setState(() {
        _focusedDay = day;
      });
   }
   static String convertDateFormat(String dateTimeString, String oldFormat, String
   newFormat) {
     DateFormat newDateFormat = DateFormat(newFormat);
     DateTime dateTime = DateFormat(oldFormat).parse(dateTimeString);
     String selectedDate = newDateFormat.format(dateTime);
     return selectedDate;
   }

   var _color = Colors.grey;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF18171E),
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
        title: const Text('ONYX'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 23, right: 23),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  SizedBox(height: 26),
                   Row(
                     children: [
                       Text('Обычный зал', style: TextStyle(
                         color: Colors.white,
                         fontSize: 18,
                         fontWeight: FontWeight.w700,
                         fontFamily: 'Arial'
                       )),
                       SizedBox(width: 24),
                       Text('VIP зал', style: TextStyle(
                         color: Colors.white70,
                         fontWeight: FontWeight.w700,
                         fontSize: 18,
                         fontFamily: 'Arial'
                       )),
                     ],
                   ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)
                          )
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Выбрано', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        color: Colors.white
                      )),
                      SizedBox(width: 29.5),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            )
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Свободно', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          color: Colors.white
                      )),
                      SizedBox(width: 29.5),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: Color(0xFF787878),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            )
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Несвободно', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          color: Colors.white
                      )),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        padding: EdgeInsets.only(top: 7, right: 8, left: 9, bottom: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            )
                        ),
                        child: Text('6', style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w700
                        )),
                      ),
                      SizedBox(width: 8),
                      Text('Номер пк', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      )),
                      SizedBox(width: 26),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFEF3F54),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)
                            )
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Просматривается', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ))
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        width: 329,
                        height: 69,
                        decoration: BoxDecoration(
                          color: Color(0xFF1F1F28),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Место - $checkedSeat', style: TextStyle(
                             color: Colors.white,
                             fontSize: 18,
                             fontFamily: 'Arial',
                             fontWeight: FontWeight.w700,
                            )),
                            Text('2 300 тг./час', style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'Arial',
                             fontWeight: FontWeight.w700,
                             fontSize: 14
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            datePickerColor = Color(0xffEF3F54);
                          });
                          showDialog(context: context, builder: (context){
                            return Dialog(
                              child: Container(
                                height: 350,
                                color: Color(0xff18171E),
                                child: TableCalendar(
                                  calendarFormat: _calendarFormat,
                                  selectedDayPredicate: (day) {
                                    return isSameDay(_focusedDay, day);
                                  },
                                  onDaySelected: _OnDaySelected,
                                  onPageChanged: (focusedDay) {
                                    _focusedDay = focusedDay;
                                  },
                                  calendarStyle: CalendarStyle(
                                    selectedDecoration: BoxDecoration(
                                      color: Color(0xffEF3F54),
                                      borderRadius: BorderRadius.circular(4)
                                    )
                                  ),
                                  headerStyle: HeaderStyle(
                                      formatButtonVisible: false,
                                      titleTextStyle: const TextStyle(
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 18,
                                      )),
                                  rowHeight: 45,
                                    focusedDay: _focusedDay,
                                    firstDay: DateTime.utc(2023, 1, 1),
                                    lastDay: DateTime.utc(2023, 12, 1),
                                  calendarBuilders: CalendarBuilders(
                                    dowBuilder: (context, day) {
                                      if (day.weekday == DateTime.sunday || day.weekday == DateTime.saturday) {
                                        final text = DateFormat.E().format(day);
                                        return Center(
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        );
                                      }else{
                                        final text = DateFormat.E().format(day);
                                        return Center(
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            );
                        });
                          },
                        child: Container(
                          width: 188,
                          height: 40,
                          decoration: BoxDecoration(
                            color: datePickerColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Выбрать дату", style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              )),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            timePickerColor = Color(0xffEF3F54);
                          });
                          showDialog(context: context, builder: (context){
                            return Center(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 329,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Color(0xff1F1F28),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Начало аренды', style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18
                                    ),),
                                    SizedBox(height: 13),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {

                                              time = "15:00";
                                            });
                                          },
                                          child: Text('15:00', style: TextStyle(
                                            color: Colors.white70,
                                            fontFamily: 'Arial',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400
                                          ),),
                                        ),
                                        VerticalDivider(
                                          color: Colors.white,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              time = "15:30";
                                            });
                                          },
                                          child: Text('15:30', style: TextStyle(
                                            color: Color(0xFFEF3F54),
                                            fontFamily: 'Arial',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700
                                          ),),
                                        ),
                                        VerticalDivider(
                                          color: Colors.white,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              time = "16:00";
                                            });
                                          },
                                          child: Text('16:00', style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Arial',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400
                                          ),),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 13),
                                    Text('Окончание аренды', style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18
                                    ),),
                                    SizedBox(height: 13),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              time = "16:00";
                                            });
                                          },
                                          child: Text('16:00', style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Arial',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400
                                          ),),
                                        ),
                                        VerticalDivider(
                                          color: Colors.white,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              time = "16:30";
                                            });
                                          },
                                          child: Text('16:30', style: TextStyle(
                                              color: Color(0xFFEF3F54),
                                              fontFamily: 'Arial',
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700
                                          ),),
                                        ),
                                        VerticalDivider(
                                          color: Colors.white,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            time = "17:00";
                                          },
                                          child: Text('17:00', style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Arial',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400
                                          ),),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                        child: Container(
                          width: 136,
                          height: 40,
                          decoration: BoxDecoration(
                              color: timePickerColor,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                  Text('Время', style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                  )),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text("Дата - ${DateFormat.yMMMd().format(_focusedDay)}, Время - $time", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Arial'
                      ),),
                    ],
                  ),
                  SizedBox(height: 16),
                  productsCard(),
                  SizedBox(height: 28.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){
                        backItem();
                        _scrollToIndex(indexOfRooms);
                      }, icon: Icon(
                        Icons.arrow_back_ios,
                      )),
                      IconButton(onPressed: (){
                        nextItemIndex();
                        _scrollToIndex(indexOfRooms);
                      }, icon: Icon(
                        Icons.arrow_forward_ios
                      ))
                    ],
                  ),
                  SizedBox(height: 22),
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
                      onPressed:  (){
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Color(0xff1F1F28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)
                              )
                            ),
                            builder: (context){
                              return Container(
                                padding: EdgeInsets.only(top: 10, right: 23, left: 10),
                                height: 380,
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        height: 56,
                                        color: Color(0xFF18171E),
                                        child: Row(
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
                                            SizedBox(width: 12),
                                            Text("4644654646", style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14
                                            )),
                                            SizedBox(width: 168),
                                            Radio(
                                              activeColor: Color(0xffEF3F54),
                                              overlayColor: MaterialStateProperty.all(
                                                  Colors.red),
                                              value: 1,
                                              groupValue: 1,
                                              onChanged: (int? value) {},
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    //   child: Container(
                                    //     padding: EdgeInsets.all(12),
                                    //     height: 56,
                                    //     color: Color(0xFF18171E),
                                    //     child: Row(
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: <Widget>[
                                    //         ClipRRect(
                                    //           borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    //           child: Container(
                                    //             width: 46.0,
                                    //             height: 32.0,
                                    //             color: Colors.white,
                                    //             child: Image.asset('assets/images/Mastercard.png'),
                                    //           ),
                                    //         ),
                                    //         SizedBox(width: 12),
                                    //         Text("4644654646", style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontFamily: 'Arial',
                                    //             fontWeight: FontWeight.w400,
                                    //             fontSize: 14
                                    //         )),
                                    //         SizedBox(width: 168),
                                    //         Radio(
                                    //           activeColor: Color(0xffEF3F54),
                                    //           overlayColor: MaterialStateProperty.all(
                                    //               Colors.red),
                                    //           value: 1,
                                    //           groupValue: 1,
                                    //           onChanged: (int? value) {},
                                    //         ),
                                    //
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(height: 8),
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    //   child: Container(
                                    //     padding: EdgeInsets.all(12),
                                    //     height: 56,
                                    //     color: Color(0xFF18171E),
                                    //     child: Row(
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: <Widget>[
                                    //         ClipRRect(
                                    //           borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    //           child: Container(
                                    //             width: 46.0,
                                    //             height: 32.0,
                                    //             color: Colors.white,
                                    //             child: Image.asset('assets/images/Mastercard.png'),
                                    //           ),
                                    //         ),
                                    //         SizedBox(width: 12),
                                    //         Text("4644654646", style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontFamily: 'Arial',
                                    //             fontWeight: FontWeight.w400,
                                    //             fontSize: 14
                                    //         )),
                                    //         SizedBox(width: 168),
                                    //         Radio(
                                    //           activeColor: Color(0xffEF3F54),
                                    //           overlayColor: MaterialStateProperty.all(
                                    //               Colors.red),
                                    //           value: 1,
                                    //           groupValue: 1,
                                    //           onChanged: (int? value) {},
                                    //         ),
                                    //
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(height: 27),
                                    Container(
                              height: 54,
                              width: 350,
                              decoration: BoxDecoration(
                              color: Color(0xffEF3F54),
                              borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Color(0xffEF3F54),
                              ),
                              onPressed:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaidForClubPage(seat: checkedSeat.toString(), data: DateFormat.yMMMd().format(_focusedDay),clubName: clubName,))),
                              child: Text("Оплатить",style: TextStyle(
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
                      child: Text("Продолжить",style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Arial'
                      ),),
                    ),
                  ),
                  SizedBox(height: 44)
                ],
              ),

            ],
          ),
        ),
      )
    );

  }
  Widget productsCard(){

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: SizedBox(
          height: 501,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ScrollablePositionedList.builder(

              itemScrollController: _itemScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: rooms.length,
              itemBuilder: (BuildContext context, int i) =>
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child:  Container(
                      margin: EdgeInsets.only(left: 5,right: 40),
                      key: ValueKey(rooms[i]),
                      width: 329,
                      height: 501,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          border: Border.all(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30
                          ),
                          itemCount: seats.length,
                          itemBuilder: (context, index){
                            return buildCard(index);
                          },
                        ),
                      )
                    ),
                  ),
            ),
          )
      ),
    );
}
   Widget buildCard(int index) {
     List<bool> trueFalse = [true, false];
     bool randomTF = trueFalse.elementAt(Random().nextInt(trueFalse.length));
     bool checked = index == checkedIndex;
     int name = seats[index];
     return GestureDetector(
       onTap: () {
         setState(() {
           checkedIndex = index;
           checkedSeat = seats[checkedIndex];
         });
       },
       child: Container(
         width: 30,
         height: 30,
         decoration: BoxDecoration(
           boxShadow: [
             BoxShadow(
               color: Color(0xFFEF3F54),
               spreadRadius: randomTF ? 1 : 0,
               blurRadius: randomTF ? 3 : 0,
             ),
           ],
           color: checked ? Colors.red : colors.elementAt(Random().nextInt(colors.length)),
           borderRadius: BorderRadius.all(Radius.circular(5)),
         ),
         child: Center(
           child: Text('$name', style: TextStyle(
             color: Colors.black,
           ),),
         ),
     ));
   }
}

