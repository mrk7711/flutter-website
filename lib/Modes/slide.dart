import 'package:flutter/material.dart';

class Slide{
  final String imageUrl;
  final String title;


  Slide({
    required this.imageUrl,
    required this.title,
});
}

final slideList=[
  Slide(
    imageUrl: 'assets/images/p1.png',
    title: 'Mode1',
  ),
  Slide(
    imageUrl: 'assets/images/p2.png',
    title: 'Mode2',
  ),
  Slide(
    imageUrl: 'assets/images/p3.png',
    title: 'Mode3',
  ),
  Slide(
    imageUrl: 'assets/images/p4.png',
    title: 'Mode4',
  ),
];