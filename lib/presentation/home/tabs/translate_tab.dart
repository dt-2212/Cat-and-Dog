import 'package:cat_dog/presentation/home/tabs/widgets/selection_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cat_dog/presentation/home/tabs/widgets/texts_and_sounds.dart';

class TranslateTab extends StatefulWidget {
  final ValueChanged<bool> onViewChanged;
  final bool isCatView;

  const TranslateTab({super.key, required this.onViewChanged, required this.isCatView});

  @override
  State<TranslateTab> createState() => TranslateTabState();
}

class TranslateTabState extends State<TranslateTab> {
  final stt.SpeechToText speechToText = stt.SpeechToText();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isCatView = true;
  bool isDogView = false;
  bool isPerson = true;
  bool isListening = false;
  String randomText = '';
  String recognizedText = '';

  void _playRandomSound() {
    Random random = Random();
    String soundToPlay =
        isCatView ? catSounds[random.nextInt(catSounds.length)] : dogSounds[random.nextInt(dogSounds.length)];
    audioPlayer.play(AssetSource(soundToPlay));
  }
  void textRandomPhrase() {
    Random random = Random();
    setState(() {
      randomText = textList[random.nextInt(textList.length)];
    });
  }

  void startListening() async {
    debugPrint("Initializing Speech-to-Text...");
    bool available = await speechToText.initialize();
    if (available) {
      debugPrint("Speech-to-Text initialized successfully!");
      setState(() => isListening = true);
      speechToText.listen(onResult: (result) {
        setState(() {
          recognizedText = result.recognizedWords;
          debugPrint("Recognized: $recognizedText");
        });
      });
    } else {
      setState(() {
        isListening = false;
        debugPrint("Speech recognition not available");
      });
    }
  }

  void stopListening() async {
    await speechToText.stop();
    setState(() {
      isListening = false;
      if (isPerson) {
        _playRandomSound();
      } else {
        textRandomPhrase();
      }
    });
  }

  void selectCat() {
    setState(() {
      isCatView = true;
      isDogView = false;
      isPerson = false;
      widget.onViewChanged(isCatView);
    });
  }

  void selectDog() {
    setState(() {
      isDogView = true;
      isCatView = false;
      isPerson = false;
      widget.onViewChanged(isCatView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              context.go('/video');
            },
            child: Image.asset(
              'assets/images/3x_images/icon_play.png',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
      backgroundColor: isCatView ? const Color(0xFFFF949B) : const Color(0xFFFDEB94),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectionButton(text: 'Cat', isSelected: isCatView, onTap: selectCat),
                const SizedBox(width: 30),
                SelectionButton(text: 'Dog', isSelected: isDogView, onTap: selectDog),
              ],
            ),
            const SizedBox(height: 100),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assets/images/2x_images/homescreen_mic.png', height: 100),
                  const SizedBox(height: 20),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                    child: Center(
                      child: Text(
                        isPerson
                            ? recognizedText.isNotEmpty
                                ? 'Voice -> $recognizedText.'
                                : 'Voice ->'
                            : 'Voice -> $randomText',
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onLongPressStart: (details) {
                    startListening();
                    isPerson = true;
                  },
                  onLongPressEnd: (details) {
                    stopListening();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    height: 155,
                    width: 155,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/2x_images/homescreen_person.png', height: 78),
                        Text(
                          isPerson
                              ? isListening
                                  ? 'Listening\n...'
                                  : 'Long press to\nrecord voice'
                              : 'Long press to\nrecord voice',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPressStart: (details) {
                    startListening();
                    isPerson = false;
                  },
                  onLongPressEnd: (details) {
                    stopListening();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    height: 155,
                    width: 155,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          isCatView
                              ? 'assets/images/2x_images/homescreen_cat.png'
                              : 'assets/images/2x_images/homescreen_dog.png',
                          height: 78,
                        ),
                        Text(
                          !isPerson
                              ? isListening
                                  ? 'Listening\n...'
                                  : 'Long press to\nrecord voice'
                              : 'Long press to\nrecord voice',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
