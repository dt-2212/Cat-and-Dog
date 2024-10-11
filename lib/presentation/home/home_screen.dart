import 'package:cat_dog/presentation/home/tabs/cat_tab.dart';
import 'package:cat_dog/presentation/home/tabs/dog_tab.dart';
import 'package:cat_dog/presentation/home/tabs/translate_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int selectedTab;

  const HomeScreen({super.key, this.selectedTab = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _tabs = [];
  int currentPageIndex = 0;
  bool isCatView = true;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.selectedTab;
    _tabs.addAll([
      TranslateTab(
        onViewChanged: _onViewChanged,
        isCatView: isCatView,
      ),
      const CatTab(),
      const DogTab(),
    ]);
  }

  void _onViewChanged(bool isCat) {
    setState(() {
      isCatView = isCat;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentPageIndex != 0
          ? const Color(0xFFFCFAFA)
          : (isCatView ? const Color(0xFFFF949B) : const Color(0xFFFDEB94)),
      body: _tabs[currentPageIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 35, left: 35, right: 35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            color: Colors.white,
            child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              currentIndex: currentPageIndex,
              onTap: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  label: 'Translate',
                  icon: Image.asset('assets/images/2x_images/icon_mic_unselected.png', height: 20),
                  activeIcon: Image.asset('assets/images/2x_images/icon_mic.png', height: 20),
                ),
                BottomNavigationBarItem(
                  label: 'Cat',
                  icon: Image.asset('assets/images/2x_images/icon_cat_unselected.png', height: 20),
                  activeIcon: Image.asset('assets/images/2x_images/icon_cat.png', height: 20),
                ),
                BottomNavigationBarItem(
                  label: 'Dog',
                  icon: Image.asset('assets/images/2x_images/icon_dog_unselected.png', height: 20),
                  activeIcon: Image.asset('assets/images/2x_images/icon_dog.png', height: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
