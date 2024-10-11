import 'package:cat_dog/presentation/video_screen//control_overlay.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class VideoSwipePage extends StatefulWidget {
  const VideoSwipePage({super.key});

  @override
  VideoSwipePageState createState() => VideoSwipePageState();
}

class VideoSwipePageState extends State<VideoSwipePage> {
  final PageController _pageController = PageController();
  bool isLiked = false;
  List<String> videoPaths = [
    'assets/videos/video_1.mp4',
    'assets/videos/video_2.mp4',
    'assets/videos/video_3.mp4',
    'assets/videos/video_4.mp4',
    'assets/videos/video_5.mp4',
  ];

  int _currentPage = 0;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(videoPaths[_currentPage]);
    _videoController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _initializeVideoPlayer(String videoPath) async {
    _videoController = VideoPlayerController.asset(videoPath);
    await _videoController.initialize();
    _videoController.setLooping(false);
    _videoController.play();
    setState(() {});
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) async {
    setState(() {
      _currentPage = index;
    });
    _videoController.pause();
    _videoController.dispose();
    await _initializeVideoPlayer(videoPaths[_currentPage]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return SafeArea(
              child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).go('/home');
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              _videoController.value.isInitialized
                  ? Center(
                      child: AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            VideoPlayer(_videoController),
                            ControlOverlay(controller: _videoController)
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / 10, left: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@Tên người dùng',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '.....',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/2x_images/icon_like.png',
                          width: 24,
                          color: isLiked ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                      const Text('1,3 Tr', style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/2x_images/icon_cmt.png',
                          width: 24,
                        ),
                        onPressed: () {},
                      ),
                      const Text('1,3 Tr', style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/2x_images/icon_share.png',
                          width: 24,
                        ),
                        onPressed: () {},
                      ),
                      const Text('1,3 Tr', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ));
        },
      ),
    );
  }
}
