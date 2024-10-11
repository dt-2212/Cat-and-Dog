import 'package:cat_dog/presentation/home/home_screen.dart';
import 'package:cat_dog/presentation/intro_screen/intro_screen_1.dart';
import 'package:cat_dog/presentation/intro_screen/intro_screen_2.dart';
import 'package:cat_dog/presentation/splash/splash_screen.dart';
import 'package:cat_dog/presentation/video_screen//video_swipe_page.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter() {
  return GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/intro_1', builder: (context, state) => const IntroScreen1()),
    GoRoute(
      path: '/intro_2',
      builder: (context, state) {
        final petType = state.extra as String?;
        return IntroScreen2(petType: petType);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final selectedTab = state.extra as int? ?? 0;
        return HomeScreen(selectedTab: selectedTab);
      },
    ),
    GoRoute(path: '/video', builder: (context, state) => const VideoSwipePage()),
  ]);
}
