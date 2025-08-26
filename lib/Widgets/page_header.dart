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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01, // حدود ۲٪ از ارتفاع
        horizontal: width * 0.01, // حدود ۵٪ از عرض
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: width * 0.02, // فونت متناسب با عرض
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
