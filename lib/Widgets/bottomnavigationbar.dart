import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final double iconSize = (width * 0.05).clamp(24, 35); // بین 24 تا 40 پیکسل
    final double fontSize = (width * 0.015).clamp(12, 20); // بین 12 تا 20 پیکسل

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF9B35B6),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: iconSize),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hearing, size: iconSize),
          label: 'Status',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: iconSize),
          label: 'My Earanica',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, size: iconSize),
          label: 'More',
        ),
      ],
      selectedLabelStyle: TextStyle(fontSize: fontSize),
    );
  }
}
