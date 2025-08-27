import 'package:flutter/material.dart';
import 'package:firstapp/widgets/reset_button.dart';
import 'package:firstapp/Widgets/page_header.dart';
import 'package:firstapp/Widgets/verticalseekbar.dart';
import 'package:firstapp/Utils/globals.dart' as globals;

class DemoNoiseReductionMode1 extends StatefulWidget {
  @override
  _DemoStartedScreenState createState() => _DemoStartedScreenState();
}

class _DemoStartedScreenState extends State<DemoNoiseReductionMode1> {
  int _sliderValue = 0;

  final List<String> _labels = [
    "OFF",
    "Mild",
    "Moderate",
    "Strong",
    "Very Strong",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final double paddingAll = (width * 0.001).clamp(8, 16);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(paddingAll), // پدینگ واکنش‌گرا
        child: Column(
          children: [
            DemoHeader(),
            Text(
              "Noise Reduction Settings",
              style: TextStyle(
                fontSize: clampDouble(width * 0.05, 18, 26),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.015),

            /// نمایش مقدار انتخابی
            Text(
              _labels[_sliderValue],
              style: TextStyle(
                fontSize: clampDouble(width * 0.08, 30, 50),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.03),

            /// SeekBar در مرکز
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth * 0.4, // عرض متناسب (مثلاً ۴۰٪)
                    height: constraints.maxHeight * 0.9, // ۹۰٪ ارتفاع فضای موجود
                    child: Verticallseekbar(
                      value: _sliderValue.toDouble(),
                      activeColor: const Color(0xFF9B35B6),
                      min: 0,
                      max: 4,
                      divisions: 4,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value.round();
                          globals.noiseLevel = _sliderValue;
                        });
                      },
                    ),
                  );
                },
              ),
            ),


            SizedBox(height: height * 0.02),

            /// دکمه ریست
            SizedBox(
              width: double.infinity,
              child: ResetButton(
                onPressed: () {
                  setState(() {
                    _sliderValue = 1;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// تابع clamp ساده برای مقیاس‌دهی
  double clampDouble(double value, double min, double max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }
}
