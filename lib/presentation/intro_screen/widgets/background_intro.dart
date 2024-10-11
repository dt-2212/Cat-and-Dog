import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundIntro extends StatelessWidget {
  const BackgroundIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/images/svg_images/ellipse 1.svg'),
          ),
          Positioned(
            top: 35,
            left: 41,
            child: SvgPicture.asset('assets/images/svg_images/ellipse 2.svg'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset('assets/images/svg_images/ellipse 3.svg'),
          ),
          Positioned(
            top: 550,
            left: 12,
            child: SvgPicture.asset('assets/images/svg_images/ellipse 4.svg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/images/svg_images/ellipse 5.svg'),
          ),
        ],
      ),
    );
  }
}
