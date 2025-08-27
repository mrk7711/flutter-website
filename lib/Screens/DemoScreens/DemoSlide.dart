import 'dart:async';
import 'package:firstapp/Screens/DemoScreens/DemoNoise/demo_noise_reduction_mode1.dart';
import 'package:firstapp/Screens/DemoScreens/DemoEqualizer/demo_sound_enhancer_mode1.dart';
import 'package:flutter/material.dart';
import '../../Widgets/slide_item.dart';
import '../../Modes/slide.dart';
import '../../Widgets/slide_dots.dart';
import 'package:firstapp/Widgets/page_header.dart';
import 'package:firstapp/Widgets/horizentalseekbar.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  double _sliderValue1 = 0.0;
  double _sliderValue2 = 0.0;
  bool showSecondSeekbar = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // واکنش‌گرایی ابعاد
    final double paddingAll = (width * 0.01).clamp(8, 16);
    final double sliderPaddingVertical = (height * 0.02).clamp(16, 25);
    final double buttonFontSize = (width * 0.035).clamp(12, 18);
    final double buttonPaddingHorizontal = (width * 0.03).clamp(12, 20);
    final double buttonPaddingVertical = (height * 0.012).clamp(6, 14);
    final double rowSpacing = (width * 0.1).clamp(16, 40);
    final double iconSize = (width * 0.04).clamp(12, 20);

    return Scaffold(
      body: Container(
        color: Color(0xFFF9ECF9),
        child: Padding(
          padding: EdgeInsets.all(paddingAll),
          child: Column(
            children: <Widget>[
              DemoHeader(),
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Positioned(
                      bottom: sliderPaddingVertical,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(slideList.length, (i) {
                          return SlideDots(i == _currentPage);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sliderPaddingVertical),
              // کارت SeekBarها و دکمه‌ها
              Card(
                color: Color(0xFFF2E9F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.05,
                  ),
                  child: Column(
                    children: [
                      // Row شامل SeekBar اصلی و دکمه + و آیکون R (در صورت فعال شدن)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // آیکون R فقط وقتی دومین SeekBar ظاهر شده
                          if (showSecondSeekbar)
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.02),
                              child: Icon(
                                Icons.arrow_right, // میتونی هر آیکون دلخواه بگذاری
                                color: Colors.green,
                                size: (width * 0.04).clamp(12, 20),
                              ),
                            ),
                          Expanded(
                            child: Horizentalseekbar(
                              value: _sliderValue1,
                              activeColor: Color(0xFF9B35B6),
                              min: 0,
                              max: 10,
                              divisions: 10,
                              onChanged: (value) {
                                setState(() => _sliderValue1 = value);
                              },
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          IconButton(
                            icon: Icon(
                              showSecondSeekbar ? Icons.remove : Icons.add,
                              color: Color(0xFF9B35B6),
                              size: (width * 0.05).clamp(16, 24),
                            ),
                            onPressed: () {
                              setState(() {
                                showSecondSeekbar = !showSecondSeekbar;
                              });
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.001),

                      // SeekBar دوم و آیکون L کنار آن
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: showSecondSeekbar
                            ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_left, // L icon
                              color: Colors.blue,
                              size: (width * 0.05).clamp(12, 20),
                            ),
                            SizedBox(width: width * 0.02),
                            Expanded(
                              child: Horizentalseekbar(
                                value: _sliderValue2,
                                activeColor: Color(0xFF9B35B6),
                                min: 0,
                                max: 10,
                                divisions: 10,
                                onChanged: (value) {
                                  setState(() => _sliderValue2 = value);
                                },
                              ),
                            ),
                          ],
                        )
                            : SizedBox.shrink(),
                      ),

                      SizedBox(height: height * 0.02),

                      // دو دکمه پایین کارت
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9B35B6),
                              padding: EdgeInsets.symmetric(
                                horizontal: buttonPaddingHorizontal,
                                vertical: buttonPaddingVertical,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DemoNoiseReductionMode1(),
                                ),
                              );
                            },
                            child: Text(
                              'Noise Reduction',
                              style: TextStyle(
                                  color: Colors.white, fontSize: buttonFontSize),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9B35B6),
                              padding: EdgeInsets.symmetric(
                                horizontal: buttonPaddingHorizontal,
                                vertical: buttonPaddingVertical,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DemoSoundEnhancerMode1(),
                                ),
                              );
                            },
                            child: Text(
                              'Sound Enhancer',
                              style: TextStyle(
                                  color: Colors.white, fontSize: buttonFontSize),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
