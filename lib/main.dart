import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geexclub/pages/PaidForClubPage.dart';
import 'package:geexclub/pages/PasswordResetPage.dart';
import 'package:geexclub/pages/ProfilePage.dart';
import 'package:geexclub/pages/NavigationPage.dart';
import 'package:geexclub/pages/ProfilePage2.dart';
import 'package:geexclub/pages/SignInPage.dart';
import 'package:geexclub/pages/SignUpPage.dart';
import 'package:geexclub/widgets/CustomCalendar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [FlutterSmartDialog.observer],
      // here
      builder: FlutterSmartDialog.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: NavigationPage(),
    );
  }
}


