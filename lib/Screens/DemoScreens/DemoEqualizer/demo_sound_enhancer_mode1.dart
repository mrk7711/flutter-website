import 'package:flutter/material.dart';
import 'package:firstapp/widgets/reset_button.dart';
import 'package:firstapp/Widgets/page_header.dart';

class DemoSoundEnhancerMode1 extends StatefulWidget {
  @override
  _DemoStartedScreenState createState() => _DemoStartedScreenState();
}
class _DemoStartedScreenState extends State<DemoSoundEnhancerMode1> {
  List<int> _sliderValues = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final double paddingAll = (width * 0.001).clamp(8, 16);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(paddingAll),
        child: Column(
          children: [

            DemoHeader(),
            Text(
              "Sound Enhancer Settings",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            // سه SeekBar کنار هم
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      // نمایش مقدار بالای هر SeekBar
                      Text(
                        _sliderValues[index].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      // SeekBar عمودی
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Slider(
                            activeColor: Color(0xFF9B35B6),
                            value: _sliderValues[index].toDouble(),
                            min: -5,
                            max: 5,
                            divisions: 10,
                            label: _sliderValues[index].toString(),
                            onChanged: (value) {
                              setState(() {
                                _sliderValues[index] = value.round();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            SizedBox(height: 20),

            // چهار دکمه کنار هم بالای ریست
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    _sliderValues = [0, 3, 0];
                  });
                }, child: Text("More speech")),
                ElevatedButton(onPressed: () {
                  setState(() {
                    _sliderValues = [0, 3, 3];
                  });
                }, child: Text("More clarity")),
                ElevatedButton(onPressed: () {
                  setState(() {
                    _sliderValues = [0, 0, -2];
                  });
                }, child: Text("Less sharp")),
                ElevatedButton(onPressed: () {
                  setState(() {
                    _sliderValues = [-2, 0, 0];
                  });
                }, child: Text("Less echo")),
              ],
            ),

            SizedBox(height: 10),

            // دکمه ریست چسبیده به پایین
            ResetButton(
              onPressed: () {
                setState(() {
                  _sliderValues = [0, 0, 0];
                });
              },
              ),
          ],
        ),
      ),
    );
  }
}
