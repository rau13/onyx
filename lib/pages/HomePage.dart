

import 'package:flutter/material.dart';
import 'package:geexclub/models/club_model.dart';
import 'package:geexclub/pages/ClubDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   static List<String> club_filters = ["Bootcamp", "Клубы", "Арены", "Киберкафе"];

  static List<ClubModel> club_list = [
    ClubModel("GameFactory", "assets/images/clubImg1.jpg"),
    ClubModel("GameFactory1", "assets/images/clubImg2.jpg"),
    ClubModel("GameFactory2", "assets/images/clubImg1.jpg"),
    ClubModel("GameFactory3", "assets/images/clubImg2.jpg"),
    ClubModel("GameFactory4", "assets/images/clubImg1.jpg")
  ];

  List<ClubModel> display_list = List.from(club_list);

  void updateList(String value){
    setState(() {
      display_list = club_list.where((element) => element.club_title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18171E),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial'
              ),
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff1F1F28),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none
                ),
                hintText: "Поиск",
                hintStyle: TextStyle(
                  color: Colors.white70,
                ),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white70
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            productsCard(),
            SizedBox(height: 15),
            Expanded(child:
            ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index){
                return InkWell(
                  onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => ClubDetails(clubName: display_list[index].club_title!))),
                  child: Card(
                    color: Color(0xFF1F1F28),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(display_list[index].club_img!, fit: BoxFit.cover),
                            ListTile(
                              title: Text(display_list[index].club_title!, style: TextStyle(
                                color: Colors.white
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ))
          ],
        ),
      ),
    );
  }
   Widget productsCard(){
     return SizedBox(
         height: 40.0,
         child: ScrollConfiguration(
           behavior: const ScrollBehavior().copyWith(overscroll: false),
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: club_filters.length,
             itemBuilder: (BuildContext context, int i) =>
                 Card(
                   color: Color(0xFF1F1F28),
                   child: Container(
                     color: Color(0xFF1F1F28),
                     width: 130.0,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Text(club_filters.elementAt(i), style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'Arial',
                             fontWeight: FontWeight.w400,
                             fontSize: 16
                         ),)
                       ],
                     ),
                   ),
                 ),
           ),
         )
     );
   }
}
