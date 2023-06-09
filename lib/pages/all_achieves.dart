import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AllAchievesPage extends StatefulWidget {
  const AllAchievesPage({Key? key}) : super(key: key);

  @override
  State<AllAchievesPage> createState() => _AllAchievesPageState();
}

class _AllAchievesPageState extends State<AllAchievesPage> {
  @override
  Widget build(BuildContext context) {
    List<String> achieves = ['Достижение1','Достижение2','Достижение3','Достижение4',
      'Достижение5','Достижение6'];
    return Scaffold(
      backgroundColor: Color(0xFF18171E),
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
    ),
      body: Container(
        padding: EdgeInsets.all(23),
        child: GridView.builder(
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
        ),
      ),
    );
  }
}
