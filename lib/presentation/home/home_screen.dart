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

  // @override
  // void initState() {
  //   super.initState();
  //   currentPageIndex = widget.selectedTab;
  //   _loadPetPreference();
  // }
  //
  // Future<void> _loadPetPreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? isCat = prefs.getBool('pet_type');
  //
  //   setState(() {
  //     _tabs.addAll(
  //       [
  //         const TranslateTab(),
  //         const CatTab(),
  //         const DogTab(),
  //       ],
  //     );
  //   });
  // }
  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.selectedTab;
    _tabs.addAll([
      const TranslateTab(),
      const CatTab(),
      const DogTab(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (_tabs.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAFA),
      body: _tabs[currentPageIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 35, left: 35, right: 35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x0D000000))],
            ),
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
