import 'package:flutter/material.dart';

class DemoHeader extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const DemoHeader({
    super.key,
    this.text = "You are using demo mode",
    this.backgroundColor = Colors.black,
    this.textColor = const Color(0xFF9B35B6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // کل عرض صفحه
      color: backgroundColor,  // رنگ بک‌گراند
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
