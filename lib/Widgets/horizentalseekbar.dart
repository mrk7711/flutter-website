import 'package:flutter/material.dart';

class Horizentalseekbar extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;
  final Color activeColor;
  const Horizentalseekbar({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 10,
    this.divisions = 10,
    this.activeColor = const Color(0xFF9B35B6),
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // padding واکنش‌گرا
    final double paddingVertical = (height * 0.02).clamp(8, 16);
    final double paddingHorizontal = (width * 0.05).clamp(16, 32);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        label: value.round().toString(),
        activeColor: activeColor,
        onChanged: onChanged,
      ),
    );
  }
}
