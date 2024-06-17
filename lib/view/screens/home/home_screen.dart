import 'package:flutter/material.dart';

import '../../../utils/video_list.dart';
import 'componects/app_bar.dart';
import 'componects/bottom_navigation_bar.dart';
import '../../modal/category_modal.dart';
import 'componects/nollywood_video.dart';
import 'componects/play_mylist_info.dart';
import 'componects/preview_video.dart';
import 'componects/today_nigeria.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Create Category instances from the JSON data
    final category = Category.fromJson(mediaJSON["categories"]![0]);
    final categoryNollywood = Category.fromJson(mediaJSON["categories"]![1]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: width,
                  child: Image.asset(
                    'asset/img/home/Rectangle 26.png',
                    fit: BoxFit.cover,
                  ),
                ),
                todayNigeria(),
                playMyListInfo(height, context),
                previewVideo(height, category, width),
                nollywoodVideo(height, categoryNollywood, width),
              ],
            ),
          ),
          homeAppBar(height),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}
