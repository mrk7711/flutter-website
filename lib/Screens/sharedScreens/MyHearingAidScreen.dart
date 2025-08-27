import 'package:firstapp/Screens/sharedScreens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class MyHearingAidScreen extends StatefulWidget {
  @override
  State<MyHearingAidScreen> createState() => _MorePageState();
}

class _MorePageState extends State<MyHearingAidScreen> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
    // اینجا می‌تونی تغییر تم رو به صورت global ذخیره کنی
  }



  void _exitApp() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('More'),
      //   backgroundColor: Color(0xFF9B35B6),
      // ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.info, color: Colors.pink[200]),
            title: Text('Learn about the app'),

          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.lightbulb, color: Colors.blue),
            title: Text('Guiding tips'),

          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.support_agent, color: Colors.yellow[700] ),
            title: Text('Request assistance'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.system_update, color: Colors.green),
            title: Text('Hearing aid software updates'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
