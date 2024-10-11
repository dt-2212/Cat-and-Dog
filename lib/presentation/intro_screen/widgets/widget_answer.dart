import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WidgetAnswer extends StatefulWidget {
  const WidgetAnswer({
    super.key,
    required this.backgroundPath,
    required this.introPath,
    required this.text,
    required this.alignment,
    required this.h,
    required this.w,
    required this.t,
    required this.l,
  });

  final String backgroundPath;
  final String introPath;
  final String text;
  final Alignment alignment;
  final TextStyle _textStyle = const TextStyle(fontSize: 12, color: Colors.white);
  final double h, w, l, t;

  @override
  WidgetAnswerState createState() => WidgetAnswerState();
}

class WidgetAnswerState extends State<WidgetAnswer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
            alignment: widget.alignment,
            child: Stack(
              children: [
                SvgPicture.asset(widget.backgroundPath, fit: BoxFit.cover, height: 63, width: 180),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 48,
                  width: 160,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(widget.text, style: widget._textStyle),
                  ),
                ),
              ],
            )),
        Positioned(
          top: widget.t,
          left: widget.l,
          child: Image.asset(widget.introPath, height: widget.h, width: widget.w),
        )
      ],
    );
  }
}
