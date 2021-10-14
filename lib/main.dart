import 'package:covid_19_tracker/screens/Home.dart';
import 'package:covid_19_tracker/screens/Login.dart';
import 'package:covid_19_tracker/screens/Registre.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      theme: ThemeData(
        primarySwatch: Colors.pink,// Change the color of the App
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

