import 'package:flutter/material.dart';

import 'widgets/myhomepage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch:Colors.purple) ,
      home:  MyHomePage(),
    );
  }
}


