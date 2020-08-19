import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackthon/Views/Welcomepage.dart';
import 'package:hackthon/Views/growthMonitoringPage/firstpage.dart';
import 'package:hackthon/Views/profielPage/userPage.dart';

import 'Model/locator_Setup.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Ailth Antenatal Care',
debugShowCheckedModeBanner: false,
      home:UserPage(),
    );
  }
}

