import 'package:flutter/material.dart';

Widget gridHeader(String path, String text, Color color) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 48,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        Image.asset(
          path,
          width: 60,
          height: 60,
          alignment: Alignment.centerLeft,
        ),
      ],
    ),
  );
}

// Widget gridHeader(String path, String text, Color color) {
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 20),
//     child: Row(
//       children: [
//         Image.asset(
//           path,
//           width: 60,
//         ),
//         Container(
//             height: 48,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.horizontal(right: Radius.circular(25)),
//               color: color,
//             ),
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 16, color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//         ),
//       ],
//     ),
//   );
// }
