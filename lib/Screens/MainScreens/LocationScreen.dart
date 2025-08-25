import 'package:firstapp/Screens/sharedScreens/SplashScreen.dart';
import 'package:flutter/material.dart';


class Locationscreen extends StatefulWidget {
  @override
  _Locationscreen createState() => _Locationscreen();
}

class _Locationscreen extends State<Locationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset('assets/images/06.jpg', // آدرس تصویر
              width: 350,
              height: 300,
            ),
            SizedBox(height: 100),
            Text(
              'Please enable Location to connect to your hearing  aid.',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 100),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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
