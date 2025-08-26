import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ResetButton({
    super.key,
    required this.onPressed,
    this.label = "Reset",
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final double buttonHeight = (height * 0.06).clamp(40, 60); // ارتفاع بین 40 تا 60
    final double fontSize = (width * 0.045).clamp(14, 20);    // فونت بین 14 تا 20
    final double borderRadius = (width * 0.03).clamp(8, 12); // شعاع گوشه بین 8 تا 12
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, buttonHeight), // ارتفاع 7% از صفحه
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // شعاع گوشه متناسب
        ),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.008, // padding متناسب با ارتفاع
          horizontal: width * 0.05, // padding متناسب با عرض
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize, // اندازه فونت متناسب با عرض
          color: const Color(0xFF9B35B6),
        ),
      ),
    );
  }
}
