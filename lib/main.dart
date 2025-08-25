import 'package:firstapp/Screens/DemoScreens/DemoSlide.dart';
import 'package:firstapp/Screens/sharedScreens/introduction.dart';
import 'package:firstapp/Screens/MainScreens/Bluetoothscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyBeautifulApp());
}

class MyBeautifulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earanica App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xFFF9ECF9),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
  }
class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // بعد از ۳ ثانیه به صفحه دوم برو
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Introduction()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/ear.png", // مسیر عکس
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}


