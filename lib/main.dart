import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/first_screen.dart';
import 'package:flutter_application_2/screens/second_screen.dart';
import 'package:flutter_application_2/screens/third_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form With Focus Node',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FirstScreen(),
      routes: {
        '/second-screen': (context) => SecondScreen(),
        '/third-screen': (context) => ThirdScreen(),
      },
    );
  }
}
