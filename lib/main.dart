import 'package:app/screens/splash_screen.dart';

import 'package:app/theme/theme.dart';
import 'package:app/widgets/animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeScalePageTransitionsBuilder(),
          TargetPlatform.iOS: FadeScalePageTransitionsBuilder(),
          TargetPlatform.linux: FadeScalePageTransitionsBuilder(),
          TargetPlatform.macOS: FadeScalePageTransitionsBuilder(),
          TargetPlatform.windows: FadeScalePageTransitionsBuilder(),
        }),
      ),
      home: const SplashScreen(),
    );
  }
}
