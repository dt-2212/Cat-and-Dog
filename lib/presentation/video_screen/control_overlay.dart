import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlOverlay extends StatelessWidget {
  const ControlOverlay({super.key, required this.controller});

  final VideoPlayerController controller;
  // static const List<double> _playbackRates = <double>[0.25, 0.5, 1.0, 1.5, 2.0];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : const ColoredBox(
                    color: Colors.black54,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  )),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(playedColor: Colors.blue, bufferedColor: Colors.white70),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: PopupMenuButton(
        //       position: PopupMenuPosition.under,
        //       itemBuilder: (BuildContext context) {
        //         return <PopupMenuItem<double>>[
        //           for (final double i in _playbackRates)
        //             PopupMenuItem(
        //               value: i,
        //               child: Text('${i}x'),
        //             )
        //         ];
        //       },
        //       initialValue: controller.value.playbackSpeed,
        //       tooltip: 'Playback Speed',
        //       onSelected: (double speed) {
        //         controller.setPlaybackSpeed(speed);
        //       },
        //       child: const Padding(
        //         padding: EdgeInsets.only(right: 10, bottom: 10),
        //         child: Icon(Icons.fast_forward, color: Colors.white),
        //       )),
        // ),
      ],
    );
  }
}
