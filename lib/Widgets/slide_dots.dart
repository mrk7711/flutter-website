import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // اندازه دایره‌ها متناسب با عرض صفحه
    final double activeSize = (width * 0.02).clamp(8, 12);
    final double inactiveSize = (width * 0.015).clamp(6, 10);
    final double margin = (width * 0.004).clamp(2, 8);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: margin),
      height: isActive ? activeSize : inactiveSize,
      width: isActive ? activeSize : inactiveSize,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF9B35B6) : Colors.grey[400],
        borderRadius: BorderRadius.circular(activeSize),
      ),
    );
  }
}
