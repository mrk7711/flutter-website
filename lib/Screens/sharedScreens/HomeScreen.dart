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
    DemoSoundEnhancerMode1(),
    DemoNoiseReductionMode1(),
    DemoNoiseReductionMode1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF9B35B6),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _navigationBottomSelect,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Setting'),
            BottomNavigationBarItem(icon: Icon(Icons.info),label: 'more'),
          ]),
    );
  }
}