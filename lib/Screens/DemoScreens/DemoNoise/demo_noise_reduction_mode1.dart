import 'package:flutter/material.dart';
import 'package:firstapp/widgets/reset_button.dart';
import 'package:firstapp/Widgets/page_header.dart';

class DemoNoiseReductionMode1 extends StatefulWidget {
  @override
  _DemoStartedScreenState createState() => _DemoStartedScreenState();
}
class _DemoStartedScreenState extends State<DemoNoiseReductionMode1> {
  int _sliderValue = 0; // مقدار SeekBar
  final List<String> _labels = [
    "OFF",          // 0
    "Mild",         // 1
    "Moderate",     // 2
    "Strong",       // 3
    "Very Strong",  // 4
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // متن بالا
            DemoHeader(),
            Text(
              "Noise Reduction Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // متن بزرگ که مقدار Slider رو نمایش می‌ده
            Text(
              _labels[_sliderValue],
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            // SeekBar عمودی
            Expanded(
              child: RotatedBox(
                quarterTurns: -1, // افقی رو عمودی می‌کنه
                child: Slider(
                  value: _sliderValue.toDouble(),
                  activeColor: Color(0xFF9B35B6),
                  min: 0,
                  max: 4,
                  divisions: 4, // می‌تونی تقسیم‌بندی رو تغییر بدی
                  label: _sliderValue.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value.round();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            // دکمه ریست چسبیده به پایین
            ResetButton(
              onPressed: () {
                setState(() {
                  _sliderValue = 1; // ریست Slider
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
