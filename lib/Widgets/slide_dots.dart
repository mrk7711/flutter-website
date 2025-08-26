import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // اندازه دایره‌ها متناسب با عرض صفحه
    final double activeSize = width * 0.009;  // حدود 3% از عرض صفحه
    final double inactiveSize = width * 0.009; // حدود 2% از عرض صفحه
    final double margin = width * 0.003; // فاصله بین دایره‌ها

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
