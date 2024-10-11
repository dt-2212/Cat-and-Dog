import 'package:cat_dog/presentation/intro_screen/widgets/background_intro.dart';
import 'package:cat_dog/presentation/intro_screen/widgets/widget_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key, this.petType});

  final String? petType;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
        child: Stack(
      children: [
        const BackgroundIntro(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Center(child: Text('Hello Pets', style: TextStyle(fontSize: 24))),
          ),
          backgroundColor: Colors.transparent,
          body: IntroQuestion2(petType: petType),
        ),
      ],
    ));
  }
}

class IntroQuestion2 extends StatefulWidget {
  const IntroQuestion2({super.key, this.petType});

  final String? petType;

  @override
  State<IntroQuestion2> createState() => _IntroQuestion1State();
}

class _IntroQuestion1State extends State<IntroQuestion2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(child: Image.asset('assets/images/3x_images/introscreen_2.png', width: 408, height: 308)),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration:
                    BoxDecoration(color: const Color(0xff5ebb98), borderRadius: BorderRadius.circular(25)),
                child: const Text('What help would you like to receive?',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (widget.petType == 'cat') {
                    context.go('/home', extra: 1);
                  } else
                    // if (widget.petType == 'dog')
                    {
                      context.go('/home', extra: 2);
                  }
                },
                child: const WidgetAnswer(
                    backgroundPath: 'assets/images/svg_images/back_2.1.svg',
                    introPath: 'assets/images/2x_images/introscreen2_img1.png',
                    text: 'Pet teasing sounds',
                    alignment: Alignment.centerLeft,
                    h: 57,
                    w: 71,
                    t: -15,
                    l: 160),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.petType == 'cat') {
                    context.go('/home');
                  } else if (widget.petType == 'dog') {
                    context.go('/home');
                  }
                  else {
                    context.go('/home');
                  }
                },
                child: const WidgetAnswer(
                    backgroundPath: 'assets/images/svg_images/back_2.2.svg',
                    introPath: 'assets/images/2x_images/introscreen2_img2.png',
                    text: 'Pet translation',
                    alignment: Alignment.centerRight,
                    h: 57,
                    w: 53,
                    t: -10,
                    l: 310),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  context.go('/home');
                },
                child: const WidgetAnswer(
                    backgroundPath: 'assets/images/svg_images/back_2.3.svg',
                    introPath: 'assets/images/2x_images/introscreen2_img3.png',
                    text: 'I WANT BOTH',
                    alignment: Alignment.centerLeft,
                    h: 61,
                    w: 44,
                    t: -15,
                    l: 145),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
