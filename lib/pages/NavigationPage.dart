import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geexclub/pages/HomePage.dart';
import 'package:geexclub/pages/ProfilePage.dart';
import 'package:geexclub/pages/ProfilePage2.dart';

import 'package:geexclub/pages/QrPage.dart';
import 'package:geexclub/pages/Scanner/scanner.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  //New
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = <Widget>[
    ProfilePage2(),
    HomePage(),
    Scanner()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1F1F28),
        title: const Text('ONYX'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 73,
        child: BottomNavigationBar(
          backgroundColor: Color(0xff1F1F28),
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon:  SvgPicture.asset("assets/images/icons/Profile.svg"),
                activeIcon: SvgPicture.asset("assets/images/icons/ProfileActive.svg", color: Color(0xffEF3F54)),
                label: '' ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/icons/Home.svg"),
                activeIcon: SvgPicture.asset("assets/images/icons/HomeActive.svg", color: Color(0xffEF3F54)),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/icons/Qr.svg"),
                activeIcon: SvgPicture.asset("assets/images/icons/QrActive.svg", color: Color(0xffEF3F54)),
                label: ''),
          ],
        ),
      ),
    );
  }
}
