import 'package:cat_dog/router/go_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatDogApp());
}

class CatDogApp extends StatelessWidget {
  const CatDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ComicSansMS'),
    );
  }
}
