import 'package:firstapp/Screens/sharedScreens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class MorePage extends StatefulWidget {
  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
    // اینجا می‌تونی تغییر تم رو به صورت global ذخیره کنی
  }

  void _launchSupport() async {
    final url = Uri.parse('https://arnicasystems.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _launchContact() async {
    final url = Uri.parse('https://arnicasystems.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
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
            leading: Icon(Icons.brightness_6, color: Colors.deepPurple),
            title: Text('Change Theme'),
            trailing: Switch(
              value: _isDarkTheme,
              onChanged: (value) {
                _toggleTheme();
              },
            ),
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.support_agent, color: Colors.green),
            title: Text('Support'),
            subtitle: Text('Get help or ask questions'),
            onTap: _launchSupport,
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.contact_mail, color: Colors.blue),
            title: Text('Contact Us'),
            subtitle: Text('Visit our website'),
            onTap: _launchContact,
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app_outlined, color: Colors.yellow[700] ),
              title: Text('Exit demo Mode'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Introduction()),
                );
              },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.roundabout_left, color: Colors.pink[200]),
            title: Text('About'),
            onTap: _exitApp,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.accessibility_new_outlined, color: Colors.brown),
            title: Text('Legal Information'),
            onTap: _exitApp,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text('Exit'),
            onTap: _exitApp,
          ),
          Divider(),
        ],
      ),
    );
  }
}
