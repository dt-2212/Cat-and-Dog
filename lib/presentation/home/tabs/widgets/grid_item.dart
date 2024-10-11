import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  const GridItem(
      {super.key, required this.items, required this.sounds, required this.texts, required this.color});

  final List<String> items;
  final List<String> sounds;
  final List<String> texts;
  final Color color;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentPlayingIndex;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound(int index) async {
    if (_currentPlayingIndex != null && _currentPlayingIndex != index) {
      await _audioPlayer.stop();
    }

    await _audioPlayer.play(AssetSource(widget.sounds[index]));
    _currentPlayingIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: widget.items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _playSound(index);
            },
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Image.asset(widget.items[index], height: 80)),
                ),
                Text(widget.texts[index], textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
