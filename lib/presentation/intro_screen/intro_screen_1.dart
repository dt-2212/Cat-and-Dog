import 'package:cat_dog/presentation/intro_screen/widgets/background_intro.dart';
import 'package:cat_dog/presentation/intro_screen/widgets/widget_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

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
          body: const IntroQuestion1(),
        ),
      ],
    ));
  }
}

class IntroQuestion1 extends StatefulWidget {
  const IntroQuestion1({super.key});

  @override
  State<IntroQuestion1> createState() => _IntroQuestion1State();
}

class _IntroQuestion1State extends State<IntroQuestion1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(child: Image.asset('assets/images/3x_images/introscreen_1.png', width: 408, height: 308)),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration:
                    BoxDecoration(color: const Color(0xff5ebb98), borderRadius: BorderRadius.circular(25)),
                child: const Text('Do you have a dog or a cat?',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  context.go('/intro_2', extra: 'cat');
                },
                child: const WidgetAnswer(
                    backgroundPath: 'assets/images/svg_images/back_1.1.svg',
                    introPath: 'assets/images/2x_images/introscreen1_img1.png',
                    text: 'I have a cat',
                    alignment: Alignment.centerLeft,
                    h: 52,
                    w: 100,
                    t: 2,
                    l: 125),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  context.go('/intro_2', extra: 'dog');
                },
                child: const WidgetAnswer(
                    backgroundPath: 'assets/images/svg_images/back_1.2.svg',
                    introPath: 'assets/images/2x_images/introscreen1_img2.png',
                    text: 'I have a dog',
                    alignment: Alignment.centerRight,
                    h: 50,
                    w: 53,
                    t: -5,
                    l: 310),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  context.go('/intro_2');
                },
                child: const WidgetAnswer(
                    backgroundPath: 'assets/images/svg_images/back_1.3.svg',
                    introPath: 'assets/images/2x_images/introscreen1_img3.png',
                    text: 'I HAVE BOTH',
                    alignment: Alignment.centerLeft,
                    h: 45,
                    w: 78,
                    t: -5,
                    l: 125),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
