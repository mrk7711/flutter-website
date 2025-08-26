import 'dart:async';
import 'package:firstapp/Screens/DemoScreens/DemoNoise/demo_noise_reduction_mode1.dart';
import 'package:firstapp/Screens/DemoScreens/DemoEqualizer/demo_sound_enhancer_mode1.dart';
import 'package:flutter/material.dart';
import '../../Widgets/slide_item.dart';
import '../../Modes/slide.dart';
import '../../Widgets/slide_dots.dart';
import 'package:firstapp/Widgets/page_header.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  double _sliderValue = 0.0;
  double _sliderValue2 = 0.0;
  @override
  void initState() {
    super.initState();
    // Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < slideList.length - 1) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 300),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // ابعاد صفحه
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Container(
        color: Color(0xFFF9ECF9),
        child: Padding(
          padding: EdgeInsets.all(width * 0.01),
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
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: height * 0.05),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for(int i = 0; i<slideList.length; i++)
                                if( i == _currentPage )
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.015,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                  child: Slider(
                    value: _sliderValue,
                    activeColor: Color(0xFF9B35B6),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: _sliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                    child: Slider(
                      value: _sliderValue2,
                      activeColor: Color(0xFF9B35B6),
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: _sliderValue2.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _sliderValue2 = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                            vertical: height * 0.005,
                          ),
                        ),
                        child: Text(
                          'Noise Reduction',
                          style: TextStyle(fontSize: width * 0.02,color: Color(0xFF9B35B6)),

                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DemoNoiseReductionMode1()),
                          );
                        },
                      ),
                      SizedBox(width: width * 0.12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                            vertical: height * 0.005,
                          ),
                        ),
                        child: Text(
                          'Sound Enhancer',
                          style: TextStyle(fontSize: width * 0.02,color: Color(0xFF9B35B6)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DemoSoundEnhancerMode1()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}