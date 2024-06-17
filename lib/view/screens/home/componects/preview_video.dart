import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../modal/category_modal.dart';
import '../../video/video_screen.dart';

Padding previewVideo(double height, Category category, double width) {
  return Padding(
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
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.14,
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
                    width: width * 0.265,
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
  );
}
