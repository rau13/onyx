import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<String> month = ["Июнь"];
  List<int> days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.0),
      body: Center(
        child:Container(
            height: 278,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ScrollablePositionedList.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: month.length,
                itemBuilder: (BuildContext context, int i) =>
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child:  Container(

                          padding: EdgeInsets.only(left: 14, right: 14),
                          width: 329,
                          height: 278,
                          decoration: BoxDecoration(
                              color: Color(0xff18171E),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                    }, icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 15,
                                    )),
                                    Text('${month[i]}', style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18
                                    ),),
                                    IconButton(onPressed: (){

                                    }, icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                    )),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('ПН', style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial'
                                    ),),
                                    Text('ВТ', style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial'
                                    ),),
                                    Text('СР', style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial'
                                    ),),
                                    Text('ЧТ', style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial'
                                    ),),
                                    Text('ПТ', style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial'
                                    ),),
                                    Text('СБ', style: TextStyle(
                                        color: Color(0xffEF3F54),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial'
                                    ),),
                                    Text('ВС', style: TextStyle(
                                        color: Color(0xffEF3F54),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial'
                                    ),)
                                  ],
                                ),
                                SizedBox(height: 11,),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        crossAxisSpacing: 25,
                                        mainAxisSpacing: 10,
                                    ),
                                    itemCount: days.length,
                                    itemBuilder: (context, index){
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${days[index]}', style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Arial'
                                          ),),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
              ),
            )
        ),
      ),
    );
  }
}
