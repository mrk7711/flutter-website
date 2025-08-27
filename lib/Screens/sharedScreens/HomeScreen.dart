import 'package:firstapp/Screens/sharedScreens/HearingAidStatusScreen.dart';
import 'package:firstapp/Screens/sharedScreens/More.dart';
import 'package:firstapp/Screens/sharedScreens/MyHearingAidScreen.dart';
import 'package:firstapp/Widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/Screens/DemoScreens/DemoNoise/demo_noise_reduction_mode1.dart';
import 'package:firstapp/Screens/DemoScreens/DemoEqualizer/demo_sound_enhancer_mode1.dart';
import 'package:firstapp/Screens/DemoScreens/DemoSlide.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _navigationBottomSelect(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List _pages = [
    GettingStartedScreen(),
    HearingAidStatusScreen(),
    MyHearingAidScreen(),
    MorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onTap: _navigationBottomSelect,
      ),
    );
  }
}