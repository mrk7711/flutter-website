import 'package:firstapp/Screens/MainScreens/LocationScreen.dart';
import 'package:firstapp/Screens/sharedScreens/SplashScreen.dart';
import 'package:flutter/material.dart';


class Bluetoothscreen extends StatefulWidget {
  @override
  _Bluetoothscreen createState() => _Bluetoothscreen();
}

class _Bluetoothscreen extends State<Bluetoothscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset('assets/images/05.jpg', // آدرس تصویر
              width: 350,
              height: 300,
            ),
            SizedBox(height: 100),
            Text(
              'Please enable Bluetooth to connect to your hearing  aid.',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 100),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Locationscreen()),);
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
                    onPressed: () {},
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
