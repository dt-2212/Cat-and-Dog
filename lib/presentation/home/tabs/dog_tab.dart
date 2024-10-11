import 'package:cat_dog/presentation/home/tabs/widgets/grid_item.dart';
import 'package:cat_dog/presentation/home/tabs/widgets/grid_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cat_dog/presentation/home/tabs/widgets/texts_and_sounds.dart';

class DogTab extends StatelessWidget {
  const DogTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list1Dog = [
      'assets/images/2x_images/dog_comehere.png',
      'assets/images/2x_images/dog_lovely.png',
      'assets/images/2x_images/dog_call.png',
      "assets/images/2x_images/dog_play.png",
      'assets/images/2x_images/dog_hug.png',
      'assets/images/2x_images/dog_feeding.png',
    ];
    List<String> list2Dog = [
      'assets/images/2x_images/dog_happy.png',
      'assets/images/2x_images/dog_iloveyou.png',
      'assets/images/2x_images/dog_knowme.png',
    ];
    List<String> list3Dog = [
      'assets/images/2x_images/dog_hungry.png',
      'assets/images/2x_images/dog_thirsty.png',
      'assets/images/2x_images/dog_hot.png',
      "assets/images/2x_images/dog_comfortable.png",
      'assets/images/2x_images/dog_scared.png',
      'assets/images/2x_images/dog_cold.png',
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
              'assets/images/3x_images/dog_list1.png',
              'A voice that draws cat to you.',
              const Color(0xFFA4AFDC),
            ),
            GridItem(items: list1Dog, sounds: dogSounds, texts: list1Text, color: const Color(0xFFFFF4BD)),
            gridHeader(
              'assets/images/3x_images/dog_list2.png',
              'Make your cat love you more.',
              const Color(0xFF81CAE7),
            ),
            GridItem(items: list2Dog, sounds: dogSounds, texts: list2Text, color: const Color(0xFFFFF4BD)),
            gridHeader(
              'assets/images/3x_images/dog_list3.png',
              'Love your cat is to know them.',
              const Color(0xFFE88570),
            ),
            GridItem(items: list3Dog, sounds: dogSounds, texts: list3Text, color: const Color(0xFFFFF4BD)),
          ],
        ),
      ),
    );
  }
}
