import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player_app/view/screen/home/home_screen.dart';

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'asset/img/app logo/logos_netflix.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
