import 'package:flutter/material.dart';
import '../Modes/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // محدود کردن حداکثر اندازه
    final double imageSize = (width * 0.6).clamp(180, 350); // بین 180 تا 350
    final double fontSize = (width * 0.05).clamp(14, 24);
    final double spacing1 = (height * 0.025).clamp(8, 30);
    final double spacing2 = (height * 0.012).clamp(5, 15);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(imageSize * 0.05),
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: spacing1),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: fontSize,
            color: const Color(0xFF9B35B6),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing2),
      ],
    );
  }
}
