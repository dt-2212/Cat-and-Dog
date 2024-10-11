import 'package:cat_dog/presentation/home/tabs/widgets/grid_item.dart';
import 'package:cat_dog/presentation/home/tabs/widgets/grid_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cat_dog/presentation/home/tabs/widgets/texts_and_sounds.dart';

class CatTab extends StatelessWidget {
  const CatTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list1Cat = [
      'assets/images/2x_images/come here.png',
      'assets/images/2x_images/lovely.png',
      'assets/images/2x_images/call.png',
      "assets/images/2x_images/let's play.png",
      'assets/images/2x_images/hug.png',
      'assets/images/2x_images/feeding.png',
    ];
    List<String> list2Cat = [
      'assets/images/2x_images/so happy.png',
      'assets/images/2x_images/i love you.png',
      'assets/images/2x_images/know me.png',
    ];
    List<String> list3Cat = [
      'assets/images/2x_images/hungry.png',
      'assets/images/2x_images/thirsty.png',
      'assets/images/2x_images/hot.png',
      "assets/images/2x_images/comfortable.png",
      'assets/images/2x_images/scared.png',
      'assets/images/2x_images/cold.png',
    ];
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFCFAFA),
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            gridHeader(
              'assets/images/2x_images/cat_list1.png',
              'A voice that draws cat to you.',
              const Color(0xFFA4AFDC),
            ),
            GridItem(items: list1Cat, sounds: catSounds, texts: list1Text, color: const Color(0xFFFFC7CB)),
            gridHeader(
              'assets/images/2x_images/cat_list2.png',
              'Make your cat love you more.',
              const Color(0xFF81CAE7),
            ),
            GridItem(items: list2Cat, sounds: catSounds, texts: list2Text, color: const Color(0xFFFFC7CB)),
            gridHeader(
              'assets/images/2x_images/cat_list3.png',
              'Love your cat is to know them.',
              const Color(0xFFE88570),
            ),
            GridItem(items: list3Cat, sounds: catSounds, texts: list3Text, color: const Color(0xFFFFC7CB)),
          ],
        ),
      ),
    );
  }
}
