import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton({super.key, required this.text, required this.isSelected, required this.onTap});

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3, color: Colors.white),
                  borderRadius: BorderRadius.circular(28),
                ),
                backgroundColor: isSelected ? Colors.white : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(text, style: const TextStyle(color: Colors.black, fontSize: 14)),
            )),
      ),
    );
  }
}
