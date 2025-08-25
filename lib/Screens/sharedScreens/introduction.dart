import 'package:firstapp/Screens/MainScreens/Bluetoothscreen.dart';
import 'package:firstapp/Screens/sharedScreens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/Screens/DemoScreens/DemoSlide.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset('assets/images/logo.png', // آدرس تصویر
              width: 350,
              height: 100,
            ),
            SizedBox(height: 50),

            Text(
              'Welcome',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Color(0xFF070700)),
            ),
            SizedBox(height: 40),
            Text(
              'Earanica Remote App enables you to change your program and adjust volume, noise level and equalization for your Bluetooth compatible hearing aid.',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            Text(
              'Do you have a hearing aid?',
              style: TextStyle(fontSize: 18, color: Colors.grey[800],fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bluetoothscreen()),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9B35B6),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text('Yes, connect now', style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.normal)),
                  ),
                ),
                SizedBox(height: 20), // فاصله بین دکمه‌ها
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF9ECF9),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text('No, maybe later', style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}