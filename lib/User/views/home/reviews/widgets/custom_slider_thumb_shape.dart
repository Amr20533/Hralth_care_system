import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';

class CustomSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(40.0, 40.0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool isDiscrete = true,
        TextPainter? labelPainter,
        RenderBox? parentBox,
        SliderThemeData? sliderTheme,
        TextDirection? textDirection,
        double? value,
        double? textScaleFactor,
        Size? sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final Paint outerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint innerCirclePaint = Paint()
      ..color = myBlueColor
      ..style = PaintingStyle.fill;

    final double outerRadius = getPreferredSize(true, isDiscrete).width / 2;
    final double innerRadius = outerRadius - 8.0; // Adjust padding as needed

    canvas.drawCircle(center, outerRadius, outerCirclePaint);
    canvas.drawCircle(center, innerRadius, innerCirclePaint);
  }
}
