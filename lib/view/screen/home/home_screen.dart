import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/video_list.dart';
import '../video/video_screen.dart';
import 'componects/app_bar.dart';
import 'componects/bottom_navigation_bar.dart';
import '../../modal/category_modal.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Column(
                        children: [
                          Text(
                            'TOP',
                            style: GoogleFonts.notoSans(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            '10',
                            style: GoogleFonts.notoSans(height: 0.9),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '  #2 in Nigeria Today',
                      style: GoogleFonts.notoSans(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.add,
                          size: 30,
                        ),
                        Text(
                          'My List',
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              categoryIndex: 2,
                              videoPlayerIndex: 0,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xffC4C4C4),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Play',
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.info,
                          size: 30,
                        ),
                        Text(
                          'Info',
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Previews',
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.13,
                        child: ListView.builder(
                          itemCount: category.videos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlayerScreen(
                                              categoryIndex: 0,
                                              videoPlayerIndex: index,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              category.videos[index].thumb),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Nollywood Movies & TV',
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.18,
                        child: ListView.builder(
                          itemCount: categoryNollywood.videos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen(
                                      categoryIndex: 1,
                                      videoPlayerIndex: index,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(categoryNollywood
                                              .videos[index].thumb),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
