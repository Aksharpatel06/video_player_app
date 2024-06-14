import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/view/provider/bottom_navigation_provider.dart';
import 'package:video_player_app/view/screen/splesh/splesh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const SpleshScreen(),
      ),
    );
  }
}
