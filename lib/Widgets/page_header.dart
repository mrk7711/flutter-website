import 'package:flutter/material.dart';

class DemoHeader extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const DemoHeader({
    super.key,
    this.text = "You are using demo mode",
    this.backgroundColor = Colors.grey,
    this.textColor = const Color(0xFF9B35B6),
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // محدود کردن padding و فونت
    final double paddingVertical = (height * 0.02).clamp(8, 16);
    final double paddingHorizontal = (width * 0.05).clamp(12, 24);
    final double fontSize = (width * 0.05).clamp(12, 24);

    return Center(
      child: Container(
        width: width * 0.96,
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16), // شعاع گوشه‌ها
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
